<?php

use App\Enums\OrderType;

return [
    OrderType::DELIVERY => 'Entrega',
    OrderType::TAKEAWAY => 'Retirada',
    OrderType::POS => 'PDV',
    OrderType::DINING_TABLE => 'Mesa',
];
