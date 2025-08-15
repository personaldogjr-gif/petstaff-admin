<x-auth-layout>
  <x-slot name="title">
    @lang('Login')
  </x-slot>

  <x-auth-card>
    <x-slot name="logo">
      <!-- <a href="/"> -->
        <x-application-logo />
      <!-- </a> -->
    </x-slot>

    <!-- Session Status -->
    <x-auth-session-status class="mb-4" :status="session('status')" />

    <!-- Social Login -->
    <x-auth-social-login />



    <!-- Validation Errors -->
    <x-auth-validation-errors class="mb-4" :errors="$errors" />

    <form method="POST" action="{{ $url ?? route('login') }}">
      @csrf

      <!-- Email Address -->
      <div>
        <x-label for="email" :value="__('Email')" />

        <x-input id="email" type="email" name="email" value="" required autofocus />
      </div>

      <!-- Password -->
      <div class="mt-4">
        <x-label for="password" :value="__('Senha')" />

        <x-input id="password" type="password" name="password" required autocomplete="current-password" />
      </div>

      <!-- Remember Me -->
      <div class="mt-4">
        <label for="remember_me" class="d-inline-flex">
          <input id="remember_me" type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
          <span class="ms-2">{{ __('Lembre-me') }}</span>
        </label>
        </div>

      <div class="d-flex align-items-center justify-content-between mt-4">
        @if (Route::has('password.request'))
        <a class="underline text-sm text-gray-600 hover:text-gray-900" href="{{ route('password.request') }}">
          {{ __('Esqueceu sua senha?') }}
        </a>
        @endif

        <x-button>
          {{ __('Entrar') }}
        </x-button>
      </div>

    </form>
  </div>

    <x-slot name="extra">
      @if (Route::has('register'))
      <p class="text-center text-gray-600 mt-4">
        Não tem uma conta? <a href="{{ route('register') }}" class="underline hover:text-gray-900">Registre-se</a>.
      </p>
      @endif
    </x-slot>
  </x-auth-card>

  <script type="text/javascript">
    function domId (name) {
      return document.getElementById(name)
    }
    function setLoginCredentials(type) {
      domId('email').value = domId(type+'_email').textContent
      domId('password').value = domId(type+'_password').textContent
    }

  </script>

</x-auth-layout>
