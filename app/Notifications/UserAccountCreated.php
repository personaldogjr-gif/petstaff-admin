<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class UserAccountCreated extends Notification implements ShouldQueue
{
    use Queueable;

    protected $request;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(array $request)
    {
        $this->request = $request;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $request = $this->request;
        $user = $notifiable;

        return (new MailMessage())
            ->line('Bem-vindo a '.app_name().'!')
            ->line('Uma nova conta foi criada para você. Por favor, use as seguintes credenciais para fazer login.')
            ->line(__('Usuário').': '.$user->username)
            ->line(__('Email').': '.$user->email)
            ->line(__('Senha').': '.$request['password']);
    }
}
