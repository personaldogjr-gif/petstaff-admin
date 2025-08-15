<template>
  <form>
    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-first-name" class="form-label">Nome <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="admin-first-name" placeholder="Digite seu Nome" />
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-last-name" class="form-label">Sobrenome <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="admin-last-name" placeholder="Digite seu Sobrenome" />
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-username" class="form-label">Nome de Usuário <span class="text-danger">*</span></label>
          <input type="text" class="form-control" id="admin-username" placeholder="Digite seu Nome de Usuário" />
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-email" class="form-label">E-mail <span class="text-danger">*</span></label>
          <input type="email" class="form-control" id="admin-email" placeholder="Digite seu E-mail" />
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-password" class="form-label">Senha <span class="text-danger">*</span></label>
          <input type="password" class="form-control" id="admin-password" placeholder="Digite sua Senha" />
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-confirm-password" class="form-label">Confirmar Senha <span class="text-danger">*</span></label>
          <input type="password" class="form-control" id="admin-confirm-password" placeholder="Confirme sua Senha" />
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-phone-number" class="form-label">Telefone <span class="text-danger">*</span></label>
          <input type="tel" class="form-control" id="admin-phone-number" placeholder="Digite sua Senha" />
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-dob" class="form-label">Data de Nascimento <span class="text-danger">*</span></label>
          <input type="date" class="form-control" id="admin-dob" />
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-gender" class="form-label">Gênero <span class="text-danger">*</span></label>
          <select name="gender" id="admin-gender" class="form-control">
            <option value="male">Masculino</option>
            <option value="female">Feminino</option>
            <option value="other">Outro</option>
          </select>
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="admin-profile" class="form-label">Perfil <small>(Opcional)</small> </label>
          <input type="file" class="form-control" id="admin-profile" />
        </div>
      </div>
    </div>
  </form>
</template>
