<form action="{{$url ?? ''}}" id="quick-action-form" class="form-disabled d-flex gap-3 align-items-stretch flex-md-row flex-column">
  @csrf
  {{$slot}}
  <input type="hidden" name="message_change-is_featured" value="Tem certeza de que deseja realizar esta ação?">
  <input type="hidden" name="message_change-status" value="Tem certeza de que deseja realizar esta ação?">
  <input type="hidden" name="message_delete" value="Tem certeza de que deseja excluí-lo?">
  <button class="btn btn-soft-primary" id="quick-action-apply">Aplicar</button>
</form>
