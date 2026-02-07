<?php


return [
    'title' => 'Instalador Food Scan',
    'next' => 'Próximo Passo',
    'welcome' => [
        'templateTitle' => 'Bem-vindo',
        'title' => 'Instalador Food Scan',
        'message' => 'Assistente de Instalação e Configuração Fácil.',
        'next' => 'Verificar Requisitos',
    ],
    'requirement' => [
        'templateTitle' => 'Passo 1 | Requisitos do Servidor',
        'title' => 'Requisitos do Servidor',
        'next' => 'Verificar Permissões',
        'version' => 'versão',
        'required' => 'obrigatório'
    ],
    'permission' => [
        'templateTitle' => 'Passo 2 | Permissões',
        'title' => 'Permissões',
        'next' => 'Configuração de Licença',
        'permission_checking' => 'Verificação de Permissão'
    ],
    'license' => [
        'templateTitle' => 'Passo 3 | Licença',
        'title' => 'Configuração de Licença',
        'next' => 'Configuração do Site',
        'active_process' => 'Processo Ativo',
        'label' => [
            'license_key' => 'Chave de Licença',
            'license_code' => 'Código de Licença'
        ]
    ],
    'site' => [
        'templateTitle' => 'Passo 4 | Configuração do Site',
        'title' => 'Configuração do Site',
        'next' => 'Configuração do Banco de Dados',
        'label' => [
            'app_name' => 'Nome do App',
            'app_url' => 'URL do App',
        ]
    ],
    'database' => [
        'templateTitle' => 'Passo 5 | Configuração do Banco de Dados',
        'title' => 'Configuração do Banco de Dados',
        'next' => 'Configuração Final',
        'fail_message' => 'Não foi possível conectar ao banco de dados.',
        'label' => [
            'database_connection' => 'Conexão do Banco de Dados',
            'database_host' => 'Host do Banco de Dados',
            'database_port' => 'Porta do Banco de Dados',
            'database_name' => 'Nome do Banco de Dados',
            'database_username' => 'Usuário do Banco de Dados',
            'database_password' => 'Senha do Banco de Dados',
        ]
    ],
    'final' => [
        'templateTitle' => 'Passo 6 | Configuração Final',
        'title' => 'Configuração Final',
        'success_message' => 'O aplicativo foi instalado com sucesso.',
        'login_info' => 'Informações de Login',
        'email' => 'E-mail',
        'password' => 'Senha',
        'email_info' => 'admin@example.com',
        'password_info' => '123456',
        'next' => 'Finalizar',
    ],
    'installed' => [
        'success_log_message' => 'Instalador Food Scan instalado com sucesso em ',
        'update_log_message' => 'Instalador Food Scan atualizado com sucesso em ',
    ],
];
