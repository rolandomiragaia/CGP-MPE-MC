function frequency = getFrequencyByPitch_(~, pitch)
    switch pitch
        case '21'
            frequency = 27.500;
        case '22'
            frequency = 29.135;
        case '23'
            frequency = 30.868;
        case '24'
            frequency = 32.703;
        case '25'
            frequency = 34.648;
        case '26'
            frequency = 36.708;
        case '27'
            frequency = 38.891;
        case '28'
            frequency = 41.203;
        case '29'
            frequency = 43.654;
        case '30'
            frequency = 46.249;
        case '31'
            frequency = 48.999;
        case '32'
            frequency = 51.913;
        case '33'
            frequency = 55.000;
        case '34'
            frequency = 58.270;
        case '35'
            frequency = 61.735;
        case '36'
            frequency = 65.406;
        case '37'
            frequency = 69.296;
        case '38'
            frequency = 73.416;
        case '39'
            frequency = 77.782;
        case '40'
            frequency = 82.407;
        case '41'
            frequency = 87.307;
        case '42'
            frequency = 92.499;
        case '43'
            frequency = 97.999;
        case '44'
            frequency = 103.83;
        case '45'
            frequency = 110.000;
        case '46'
            frequency = 116.54;
        case '47'
            frequency = 123.47;
        case '48'
            frequency = 130.81;
        case '49'
            frequency = 138.59;
        case '50'
            frequency = 146.83;
        case '51'
            frequency = 155.56;
        case '52'
            frequency = 164.81;
        case '53'
            frequency = 174.61;
        case '54'
            frequency = 185.00;
        case '55'
            frequency = 196.00;
        case '56'
            frequency = 207.65;
        case '57'
            frequency = 220.00;
        case '58'
            frequency = 233.08;
        case '59'
            frequency = 246.94;
        case '60'
            frequency = 261.6;
        case '61'
            frequency = 277.18;
        case '62'
            frequency = 293.67;
        case '63'
            frequency = 311.13;
        case '64'
            frequency = 329.63;
        case '65'
            frequency = 349.23;
        case '66'
            frequency = 369.99;
        case '67'
            frequency = 392.00;
        case '68'
            frequency = 415.30;
        case '69'
            frequency = 440.0;
        case '70'
            frequency = 466.16;
        case '71'
            frequency = 493.88;
        case '72'
            frequency = 523.25;
        case '73'
            frequency = 554.37;
        case '74'
            frequency = 587.33;
        case '75'
            frequency = 622.25;
        case '76'
            frequency = 659.26;
        case '77'
            frequency = 698.46;
        case '78'
            frequency = 739.99;
        case '79'
            frequency = 783.99;
        case '80'
            frequency = 830.61;
        case '81'
            frequency = 880.00;
        case '82'
            frequency = 932.33;
        case '83'
            frequency = 987.77;
        case '84'
            frequency = 1046.50;
        otherwise
            frequency = 261.6;
    end
end
