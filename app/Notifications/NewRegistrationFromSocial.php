<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\URL;

class NewRegistrationFromSocial extends Notification
{
    use Queueable;

    /**
     * The callback that should be used to build the mail message.
     *
     * @var \Closure|null
     */
    public static $toMailCallback;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $user = $notifiable;

        if ($user->email_verified_at == '') {
            $verificationUrl = $this->verificationUrl($notifiable);

            return (new MailMessage())
                ->subject('Obrigado pelo registro!')
                ->line('Clique no botão abaixo para verificar seu endereço de e-mail.')
                ->action('Verifique o endereço de e-mail', $verificationUrl)
                ->line('Se você não criou uma conta, nenhuma ação adicional será necessária.');
        }

        return (new MailMessage())
            ->subject('Obrigado pelo registro!')
            ->line('Obrigado pela registro na '.app_name().'.')
            ->action('Visitar', url('/'))
            ->line('Estamos muito felizes que você começou a usar '.app_name().'!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        $user = $notifiable;

        $text = 'Cadastro concluído! | Novo cadastro concluído para <strong>'.$user->name.'</strong>';

        $url_backend = route('backend.users.profile', $user->id);
        $url_frontend = route('frontend.users.profile', $user->id);

        return [
            'title' => 'Novo Cadastro',
            'module' => 'User',
            'type' => 'created', // created, published, viewed,
            'icon' => 'fas fa-user',
            'text' => $text,
            'url_backend' => $url_backend,
            'url_frontend' => $url_frontend,
        ];
    }

    /**
     * Get the verification URL for the given notifiable.
     *
     * @param  mixed  $notifiable
     * @return string
     */
    protected function verificationUrl($notifiable)
    {
        return URL::temporarySignedRoute(
            'verification.verify',
            Carbon::now()->addMinutes(Config::get('auth.verification.expire', 60)),
            [
                'id' => $notifiable->getKey(),
                'hash' => sha1($notifiable->getEmailForVerification()),
            ]
        );
    }

    /**
     * Set a callback that should be used when building the notification mail message.
     *
     * @param  \Closure  $callback
     * @return void
     */
    public static function toMailUsing($callback)
    {
        static::$toMailCallback = $callback;
    }
}
