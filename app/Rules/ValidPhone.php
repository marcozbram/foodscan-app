<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Smartisan\Settings\Facades\Settings;


class ValidPhone implements Rule
{
    public $message = '';
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value): bool
    {
        // Simplified validation for Vercel deployment without PragmaRX
        if (strlen($value) < 8 || strlen($value) > 15) {
            $this->message = 'The :attribute number is invalid.';
            return false;
        }

        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message(): string
    {
        return $this->message;
    }
}