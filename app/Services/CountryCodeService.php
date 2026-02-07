<?php

namespace App\Services;


use Exception;
use Illuminate\Support\Facades\Log;
use App\Libraries\QueryExceptionLibrary;


class CountryCodeService
{
    /**
     * @throws Exception
     */
    public function list(): array
    {
        try {
            // Simplified list for Vercel deployment
            $countries = [
                'BR' => 'Brazil',
                'US' => 'United States',
                'PT' => 'Portugal',
                'ES' => 'Spain',
                'AR' => 'Argentina',
                'CL' => 'Chile',
                'UY' => 'Uruguay',
                'PY' => 'Paraguay',
                'BO' => 'Bolivia',
                'PE' => 'Peru',
                'CO' => 'Colombia',
                'VE' => 'Venezuela',
                'EC' => 'Ecuador',
                'MX' => 'Mexico',
            ];

            $countryArray = [];
            foreach ($countries as $key => $name) {
                $countryArray[] = (object)[
                    'country_code' => $key,
                    'country_name' => $name . ' (' . $key . ')',
                ];
            }
            return ['data' => $countryArray];
        }
        catch (Exception $exception) {
            Log::info($exception->getMessage());
            throw new Exception(QueryExceptionLibrary::message($exception), 422);
        }
    }

    /**
     * @throws Exception
     */
    public function show($country)
    {
        return (object)[
            'cca3' => $country,
            'admin' => $country,
        ];
    }
}
