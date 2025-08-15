@if ($data->payment_status == 'unpaid')
    <span class="badge bg-soft-danger rounded-pill text-capitalize">
        Não Pago
    </span>
@elseif($data->payment_status == 'pending')
    <span class="badge bg-soft-primary rounded-pill text-capitalize">
        Pendente
    </span>
@else
    <span class="badge bg-soft-primary rounded-pill text-capitalize">
        Pago
    </span>
@endif
