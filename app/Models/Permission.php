<?php

namespace App\Models;

class Permission extends \Spatie\Permission\Models\Permission
{
    /**
     * Default Permissions of the Application.
     */
    public static function defaultPermissions()
    {
        return [
            
            'view_booking' => 'Ver Reserva',
            'add_booking' => 'Adicionar Reserva',
            'edit_booking' => 'Editar Reserva',
            'delete_booking' => 'Deletar Reserva',

            'view_boarding' => 'Ver Hospedagem',
            'add_boarding' => 'Adicionar Hospedagem',
            'edit_boarding' => 'Editar Hospedagem',
            'delete_boarding' => 'Deletar Hospedagem',

            'view_boarding_booking' => 'Ver Reserva de Hospedagem',
            'add_boarding_booking' => 'Adicionar Reserva de Hospedagem',
            'edit_boarding_booking' => 'Editar Reserva de Hospedagem',
            'delete_boarding_booking' => 'Deletar Reserva de Hospedagem',

            'view_boarder' => 'Ver Locatário',
            'add_boarder' => 'Adicionar Locatário',
            'edit_boarder' => 'Editar Locatário',
            'delete_boarder' => 'Deletar Locatário',

            'view_facility' => 'Ver Facilidade',
            'add_facility' => 'Adicionar Facilidade',
            'edit_facility' => 'Editar Facilidade',
            'delete_facility' => 'Deletar Facilidade',

            'view_veterinary' => 'Ver Veterinária',
            'add_veterinary' => 'Adicionar Veterinária',
            'edit_veterinary' => 'Editar Veterinária',
            'delete_veterinary' => 'Deletar Veterinária',

            'view_veterinary_booking' => 'Ver Reserva Veterinária',
            'add_veterinary_booking' => 'Adicionar Reserva Veterinária',
            'edit_veterinary_booking' => 'Editar Reserva Veterinária',
            'delete_veterinary_booking' => 'Deletar Reserva Veterinária',

            'view_veterinarian' => 'Ver Veterinário',
            'add_veterinarian' => 'Adicionar Veterinário',
            'edit_veterinarian' => 'Editar Veterinário',
            'delete_veterinarian' => 'Deletar Veterinário',

            'view_veterinary_category' => 'Ver Categoria Veterinária',
            'add_veterinary_category' => 'Adicionar Categoria Veterinária',
            'edit_veterinary_category' => 'Editar Categoria Veterinária',
            'delete_veterinary_category' => 'Deletar Categoria Veterinária',

            'view_veterinary_service' => 'Ver Serviço Veterinário',
            'add_veterinary_service' => 'Adicionar Serviço Veterinário',
            'edit_veterinary_service' => 'Editar Serviço Veterinário',
            'delete_veterinary_service' => 'Deletar Serviço Veterinário',


            'view_grooming' => 'Ver Tosagem',
            'add_grooming' => 'Adicionar Tosagem',
            'edit_grooming' => 'Editar Tosagem',
            'delete_grooming' => 'Deletar Tosagem',

            'view_grooming_booking' => 'Ver Reserva de Tosagem',
            'add_grooming_booking' => 'Adicionar Reserva de Tosagem',
            'edit_grooming_booking' => 'Editar Reserva de Tosagem',
            'delete_grooming_booking' => 'Deletar Reserva de Tosagem',

            'view_groomer' => 'Ver Tosador',
            'add_groomer' => 'Adicionar Tosador',
            'edit_groomer' => 'Editar Tosador',
            'delete_groomer' => 'Deletar Tosador',

            'view_grooming_category' => 'Ver Categoria de Tosagem',
            'add_grooming_category' => 'Adicionar Categoria de Tosagem',
            'edit_grooming_category' => 'Editar Categoria de Tosagem',
            'delete_grooming_category' => 'Deletar Categoria de Tosagem',

            'view_grooming_service' => 'Ver Serviço de Tosagem',
            'add_grooming_service' => 'Adicionar Serviço de Tosagem',
            'edit_grooming_service' => 'Editar Serviço de Tosagem',
            'delete_grooming_service' => 'Deletar Serviço de Tosagem',

            'view_traning' => 'Ver Treinamento',
            'add_traning' => 'Adicionar Treinamento',
            'edit_traning' => 'Editar Treinamento',
            'delete_traning' => 'Deletar Treinamento',

            'view_training_booking' => 'Ver Reserva de Treinamento',
            'add_training_booking' => 'Adicionar Reserva de Treinamento',
            'edit_training_booking' => 'Editar Reserva de Treinamento',
            'delete_training_booking' => 'Deletar Reserva de Treinamento',

            'view_trainer' => 'Ver Treinador',
            'add_trainer' => 'Adicionar Treinador',
            'edit_trainer' => 'Editar Treinador',
            'delete_trainer' => 'Deletar Treinador',

            'view_training_type' => 'Ver Tipo de Treinamento',
            'add_training_type' => 'Adicionar Tipo de Treinamento',
            'edit_training_type' => 'Editar Tipo de Treinamento',
            'delete_training_type' => 'Deletar Tipo de Treinamento',

            'view_traning_duration' => 'Ver Duração do Treinamento',
            'add_traning_duration' => 'Adicionar Duração do Treinamento',
            'edit_traning_duration' => 'Editar Duração do Treinamento',
            'delete_traning_duration' => 'Deletar Duração do Treinamento',


            'view_walking' => 'Ver Passeio',
            'add_walking' => 'Adicionar Passeio',
            'edit_walking' => 'Editar Passeio',
            'delete_walking' => 'Deletar Passeio',

            'view_walking_booking' => 'Ver Reserva de Passeio',
            'add_walking_booking' => 'Adicionar Reserva de Passeio',
            'edit_walking_booking' => 'Editar Reserva de Passeio',
            'delete_walking_booking' => 'Deletar Reserva de Passeio',

            'view_booking_request' => 'Ver Solicitação de Reserva',
            'add_booking_request' => 'Adicionar Solicitação de Reserva',
            'edit_booking_request' => 'Editar Solicitação de Reserva',
            'delete_booking_request' => 'Deletar Solicitação de Reserva',


            'view_walker' => 'Ver Passeador',
            'add_walker' => 'Adicionar Passeador',
            'edit_walker' => 'Editar Passeador',
            'delete_walker' => 'Deletar Passeador',

            'view_walking_duration' => 'Ver Duração do Passeio',
            'add_walking_duration' => 'Adicionar Duração do Passeio',
            'edit_walking_duration' => 'Editar Duração do Passeio',
            'delete_walking_duration' => 'Deletar Duração do Passeio',

            'view_daycare' => 'Ver Creche',
            'add_daycare' => 'Adicionar Creche',
            'edit_daycare' => 'Editar Creche',
            'delete_daycare' => 'Deletar Creche',

            'view_daycare_booking' => 'Ver Reserva de Creche',
            'add_daycare_booking' => 'Adicionar Reserva de Creche',
            'edit_daycare_booking' => 'Editar Reserva de Creche',
            'delete_daycare_booking' => 'Deletar Reserva de Creche',

            'view_care_taker' => 'Ver Cuidador',
            'add_care_taker' => 'Adicionar Cuidador',
            'edit_care_taker' => 'Editar Cuidador',
            'delete_care_taker' => 'Deletar Cuidador',

            'view_pet_sitter' => 'Ver Babá de Pet',
            'add_pet_sitter' => 'Adicionar Babá de Pet',
            'edit_pet_sitter' => 'Editar Babá de Pet',
            'delete_pet_sitter' => 'Deletar Babá de Pet',

            'view_pet_store' => 'Ver Loja de Pet',
            'add_pet_store' => 'Adicionar Loja de Pet',
            'edit_pet_store' => 'Editar Loja de Pet',
            'delete_pet_store' => 'Deletar Loja de Pet',

            'view_service' => 'Ver Serviço',
            'add_service' => 'Adicionar Serviço',
            'edit_service' => 'Editar Serviço',
            'delete_service' => 'Deletar Serviço',
            'add_assign_service' => 'Adicionar Atribuir Serviço',

            'view_category' => 'Ver Categoria',
            'add_category' => 'Adicionar Categoria',
            'edit_category' => 'Editar Categoria',
            'delete_category' => 'Deletar Categoria',

            'view_subcategory' => 'Ver Subcategoria',
            'add_subcategory' => 'Adicionar Subcategoria',
            'edit_subcategory' => 'Editar Subcategoria',
            'delete_subcategory' => 'Deletar Subcategoria',

            'view_employees' => 'Ver Funcionários',
            'add_employees' => 'Adicionar Funcionários',
            'edit_employees' => 'Editar Funcionários',
            'delete_employees' => 'Deletar Funcionários',

            'view_pending_employees' => 'Ver Funcionários Pendentes',
            
            'edit_employee_password'=>'Editar Senha do Funcionário',

            'view_employee_earning' => 'Ver Ganhos do Funcionário',
            'add_employee_earning' => 'Adicionar Ganhos do Funcionário',
            'edit_employee_earning' => 'Editar Ganhos do Funcionário',
            'delete_employee_earning' => 'Deletar Ganhos do Funcionário',

            'view_employee_payout' => 'Ver Pagamento do Funcionário',
            'add_employee_payout' => 'Adicionar Pagamento do Funcionário',
            'edit_employee_payout' => 'Editar Pagamento do Funcionário',
            'delete_employee_payout' => 'Deletar Pagamento do Funcionário',

            'view_owners' => 'Ver Donos',
            'add_owners' => 'Adicionar Donos',
            'edit_owners' => 'Editar Donos',
            'delete_owners' => 'Deletar Donos',

            "view_owner's_pet" => "Ver Pets de Donos",
            "add_owner's_pet" => "Adicionar Pets de Donos",
            "edit_owner's_pet" => "Editar Pets de Donos",
            "delete_owner's_pet" => "Deletar Pets de Donos",

            'edit_user_password' => 'Editar Senha do Usuário',

            'view_review' => 'Ver Review',
            'add_review' => 'Adicionar Review',
            'edit_review' => 'Editar Review',
            'delete_review' => 'Deletar Review',

            'view_order_review' => 'Ver Review de Pedido',
            'add_order_review' => 'Adicionar Review de Pedido',
            'edit_order_review' => 'Editar Review de Pedido',
            'delete_order_review' => 'Deletar Review de Pedido',

            'view_tax' => 'Ver Impostos',
            'add_tax' => 'Adicionar Impostos',
            'edit_tax' => 'Editar Impostos',
            'delete_tax' => 'Deletar Impostos',

            'view_events' => 'Ver Eventos',
            'add_events' => 'Adicionar Eventos',
            'edit_events' => 'Editar Eventos',
            'delete_events' => 'Deletar Eventos',

            'view_blogs' => 'Ver Blogs',
            'add_blogs' => 'Adicionar Blogs',
            'edit_blogs' => 'Editar Blogs',
            'delete_blogs' => 'Deletar Blogs',

            'view_syetem_service' => 'Ver Serviço do Sistema',
            'add_syetem_service' => 'Adicionar Serviço do Sistema',
            'edit_syetem_service' => 'Editar Serviço do Sistema',
            'delete_syetem_service' => 'Deletar Serviço do Sistema',

            'view_pet' => 'Ver Pet',
            'add_pet' => 'Adicionar Pet',
            'edit_pet' => 'Editar Pet',
            'delete_pet' => 'Deletar Pet',

            'view_pet_type' => 'Ver Tipo de Pet',
            'add_pet_type' => 'Adicionar Tipo de Pet',
            'edit_pet_type' => 'Editar Tipo de Pet',
            'delete_pet_type' => 'Deletar Tipo de Pet',

            'view_breed' => 'Ver Raça',
            'add_breed' => 'Adicionar Raça',
            'edit_breed' => 'Editar Raça',
            'delete_breed' => 'Deletar Raça',

            'view_reports' => 'Ver Relatórios',
            'add_reports' => 'Adicionar Relatórios',
            'edit_reports' => 'Editar Relatórios',
            'delete_reports' => 'Deletar Relatórios',

            'view_daily_bookings' => 'Ver Reservas Diária',
            'add_daily_bookings' => 'Adicionar Reservas Diária',
            'edit_daily_bookings' => 'Editar Reservas Diária',
            'delete_daily_bookings' => 'Deletar Reservas Diária',

            'view_overall_bookings' => 'Ver Reservas Geral',
            'add_overall_bookings' => 'Adicionar Reservas Geral',
            'edit_overall_bookings' => 'Editar Reservas Geral',
            'delete_overall_bookings' => 'Deletar Reservas Geral',

            'view_order_reports' => 'Ver Relatórios de Pedido',
            'add_order_reports' => 'Adicionar Relatórios de Pedido',
            'edit_order_reports' => 'Editar Relatórios de Pedido',
            'delete_order_reports' => 'Deletar Relatórios de Pedido',



            'view_page' => 'Ver Páginas',
            'add_page' => 'Adicionar Página',
            'edit_page' => 'Editar Página',
            'delete_page' => 'Deletar Página',


            'view_setting' => 'Ver Configuração',
            'add_setting' => 'Adicionar Configuração',
            'edit_setting' => 'Editar Configuração',
            'delete_setting' => 'Deletar Configuração',

            'view_notification' => 'Ver Notificação',
            'add_notification' => 'Adicionar Notificação',
            'edit_notification' => 'Editar Notificação',
            'delete_notification' => 'Deletar Notificação',

            'view_notification_template' => 'Ver Template de Notificação',
            'add_notification_template' => 'Adicionar Template de Notificação',
            'edit_notification_template' => 'Editar Template de Notificação',
            'delete_notification_template' => 'Deletar Template de Notificação',

            'view_app_banner' => 'Ver App Banner',
            'add_app_banner' => 'Adicionar App Banner',
            'edit_app_banner' => 'Editar App Banner',
            'delete_app_banner' => 'Deletar App Banner',

            'view_constant' => 'Ver Constante',
            'add_constant' => 'Adicionar Constante',
            'edit_constant' => 'Editar Constante',
            'delete_constant' => 'Deletar Constante',

            'view_permission' => 'Ver Permissão',
            'add_permission' => 'Adicionar Permissão',
            'edit_permission' => 'Editar Permissão',
            'delete_permission' => 'Deletar Permissão',

            'view_modules' => 'Ver Módulos',
            'add_modules' => 'Adicionar Módulos',
            'edit_modules' => 'Editar Módulos',
            'delete_modules' => 'Deletar Módulos', 

            'view_product' => 'Ver Produtos',
            'add_product' => 'Adicionar Produtos',
            'edit_product' => 'Editar Produtos',
            'delete_product' => 'Deletar Produtos', 

            'view_product_category' => 'Ver Categoria de Produto',
            'add_product_category' => 'Adicionar Categoria de Produto',
            'edit_product_category' => 'Editar Categoria de Produto',
            'delete_product_category' => 'Deletar Categoria de Produto', 

            'view_product_subcategory' => 'Ver Subcategoria de Produto',
            'add_product_subcategory' => 'Adicionar Subcategoria de Produto',
            'edit_product_subcategory' => 'Editar Subcategoria de Produto',
            'delete_product_subcategory' => 'Deletar Subcategoria de Produto', 

            'view_brand' => 'Ver Marca',
            'add_brand' => 'Adicionar Marca',
            'edit_brand' => 'Editar Marca',
            'delete_brand' => 'Deletar Marca', 

            'view_unit' => 'Ver Unidade',
            'add_unit' => 'Adicionar Unidade',
            'edit_unit' => 'Editar Unidade',
            'delete_unit' => 'Deletar Unidade', 

            'view_tag' => 'Ver Tag',
            'add_tag' => 'Adicionar Tag',
            'edit_tag' => 'Editar Tag',
            'delete_tag' => 'Deletar Tag', 

            'view_product_variation' => 'Ver Variação de Produto',
            'add_product_variation' => 'Adicionar Variação de Produto',
            'edit_product_variation' => 'Editar Variação de Produto',
            'delete_product_variation' => 'Deletar Variação de Produto', 

            'view_order' => 'Ver Pedido',
            'add_order' => 'Adicionar Pedido',
            'edit_order' => 'Editar Pedido',
            'delete_order' => 'Deletar Pedido', 

            'view_supply' => 'Ver Suprimento',
            'add_supply' => 'Adicionar Suprimento',
            'edit_supply' => 'Editar Suprimento',
            'delete_supply' => 'Deletar Suprimento', 

            'view_logistics' => 'Ver Logística',
            'add_logistics' => 'Adicionar Logística',
            'edit_logistics' => 'Editar Logística',
            'delete_logistics' => 'Deletar Logística', 

            'view_shipping_zones' => 'Ver Zonas de Envio',
            'add_shipping_zones' => 'Adicionar Zonas de Envio',
            'edit_shipping_zones' => 'Editar Zonas de Envio',
            'delete_shipping_zones' => 'Deletar Zonas de Envio', 

            'view_location' => 'Ver Localização',
            'add_location' => 'Adicionar Localização',
            'edit_location' => 'Editar Localização',
            'delete_location' => 'Deletar Localização', 

            'view_city' => 'Ver Cidade',
            'add_city' => 'Adicionar Cidade',
            'edit_city' => 'Editar Cidade',
            'delete_city' => 'Deletar Cidade', 

            'view_state' => 'Ver Estado',
            'add_state' => 'Adicionar Estado',
            'edit_state' => 'Editar Estado',
            'delete_state' => 'Deletar Estado', 

            'view_country' => 'Ver País',
            'add_country' => 'Adicionar País',
            'edit_country' => 'Editar País',
            'delete_country' => 'Deletar País', 

        ];
    }

    /**
     * Name should be lowercase.
     *
     * @param  string  $value  Name value
     */
    public function setNameAttribute($value)
    {
        $this->attributes['name'] = strtolower($value);
    }
}
