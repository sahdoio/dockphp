<?php

function formatServices(string $servicesInline): string {
    $services = explode('|', $servicesInline);

    $servicesHtml = '';
    foreach($services as $service) {
        $servicesHtml .= <<<HTML
            <div class="servico">
                <h3>$service</h3>
                <p>Descrição breve do $service.</p>
            </div>
        HTML;
    }

    return $servicesHtml;
}

$template = file_get_contents(__DIR__ . '/template/base.html');

$replaces = [
    '{COMPANY_NAME}' => getenv('COMPANY_NAME'),
    '{SERVICES}'     => formatServices(getenv('SERVICES')),
    '{BUILD_INFO}'   => 'Template gerado em: ' . date('d/m/Y H:i:s')
];

$output = str_replace(array_keys($replaces), $replaces, $template);

echo $output;
