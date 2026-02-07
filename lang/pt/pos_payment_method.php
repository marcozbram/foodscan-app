<?php

use App\Enums\PosPaymentMethod;

return [
    PosPaymentMethod::CARD => 'Cartão',
    PosPaymentMethod::CASH => 'Dinheiro',
    PosPaymentMethod::OTHER => 'Outro',
    PosPaymentMethod::MOBILE_BANKING => 'Mobile Banking'
];
