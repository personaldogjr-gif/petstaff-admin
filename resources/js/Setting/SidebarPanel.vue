<template>
  <div class="col-md-4 col-lg-3">
    <div class="card">
      <div class="card-body">
        <div class="list-group list-group-flush customizer-panel">
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.home'}" class="btn btn-border"><i class="fas fa-cube"></i>Geral</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.misc'}" class="btn btn-border"><i class="fa-solid fa-screwdriver-wrench "></i>Configurações Diversas</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.quick-booking'}" class="btn btn-border"><i class="fa-solid fa-paper-plane"></i>Reserva Rápida</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.invoice-setting'}" class="btn btn-border"><i class="fa-solid fa-file-invoice" aria-hidden="true"></i>Configurações de Fatura</router-link></div>
          <!-- <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.social-profile'}" class="btn btn-border"><i class="fas fa-users"></i>Perfil Social</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.meta'}" class="btn btn-border"><i class="fas fa-globe-asia"></i>Meta</router-link></div> -->
          <!-- <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.analitics'}" class="btn btn-border"><i class="fas fa-chart-line"></i>Analytics</router-link></div> -->
          <!-- <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.custom-code'}" class="btn btn-border"><i class="fa-solid fa-file-code"></i>Código Customizado</router-link></div> -->
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.custom-code'}" class="btn btn-border"><i class="fa-solid fa-file-code"></i>Código Customizado</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.customization'}" class="btn btn-border"><i class="fa-solid fa-swatchbook"></i>Customização</router-link></div>
          <!-- <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.mobile'}" class="btn btn-border"><i class="fa-solid fa-mobile-screen-button"></i>Mobile</router-link></div> -->
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.booking-configuration'}" class="btn btn-border"><i class="fa-solid fa-paper-plane"></i>Configurações de Reserva</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.mail'}" class="btn btn-border"><i class="fas fa-envelope"></i>Configurações de E-mail</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.notificationsetting'}" class="btn btn-border"><i class="fa-solid fa-bullhorn"></i>Configurações de Notificação</router-link></div>
          <div v-if="role() == 'admin'"  class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.integration'}" class="btn btn-border"><i class="fa-solid fa-sliders"></i>Integrações</router-link></div>
          <!-- app-config-menu -->
          <div v-if="role() == 'admin'"  class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.other-settings'}" class="btn btn-border"><i class="fa-solid fa-sliders"></i>Configurações da Aplicação</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.custom-fields'}" class="btn btn-border"><i class="fa-solid fa-bars"></i>Campos Customizados</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.currency-settings'}" class="btn btn-border"><i class="fa fa-dollar fa-lg mr-2"></i>Configurações de Moeda</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.commission'}" class="btn btn-border"><i class="fa fa-percent fa-lg mr-2"></i>Comissões</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.holiday'}" class="btn btn-border"><i class="fa-solid fa-calendar-check mr-2"></i>Feriados</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.bussiness-hours'}" class="btn btn-border"><i class="fa-solid fa-clock"></i>Horário Comercial</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.grooming-bussiness-hours'}" class="btn btn-border"><i class="fa-solid fa-clock"></i>Horário Comercial de Banho e Tosa</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.training-bussiness-hours'}" class="btn btn-border"><i class="fa-solid fa-clock"></i>Horário Comercial de Treinamento</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.payment-method'}" class="btn btn-border"><i class="fa-solid fa-coins"></i>Métodos de Pagamentos</router-link></div>
          <div class="mb-3" @click="toggle()"><router-link :to="{name: 'Settings.language-settings'}" class="btn btn-border"><i class="fa fa-language" aria-hidden="true"></i>Configurações de Idioma</router-link></div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
const toggle = () =>{
  const formOffcanvas = document.getElementById('offcanvas')
  formOffcanvas.classList.add("show")
}
const hasPermissions = (name) => {
  return window.auth_permissions.includes(name)
}
const role = () => {
  return window.auth_role[0]
}


</script>
<style scoped>
.btn-border {
  text-align: left;
  display: flex;
  align-items: center;
  gap: .75rem;
}
</style>
