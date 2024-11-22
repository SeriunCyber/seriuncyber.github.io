const windowsLinks = [
    'https://scan.cyberessentials.live/usersc/testfiles/macro/CEPlus.xlsm',
    'https://scan.cyberessentials.live/usersc/testfiles/macro/CEPlus.docm',
    'https://scan.cyberessentials.live/usersc/testfiles/windows/CEPlus.zip',
    'https://scan.cyberessentials.live/usersc/testfiles/windows/CEPlus.bat',
    'https://scan.cyberessentials.live/usersc/testfiles/windows/CEPlus.scr',
    'https://scan.cyberessentials.live/usersc/testfiles/windows/CEPlus.exe',
    'https://scan.cyberessentials.live/usersc/testfiles/windows/CEPlus.pif',
    'https://scan.cyberessentials.live/usersc/testfiles/windows/CEPlus.lnk',
    'https://scan.cyberessentials.live/usersc/testfiles/windows-archive/CEPlus.zip',
    'https://scan.cyberessentials.live/usersc/testfiles/amtso/PotentiallyUnwanted.exe'
];

const potentiallyUnwantedLink = "https://scan.cyberessentials.live/usersc/testfiles/amtso/PotentiallyUnwanted.exe";

const eicarLinks = [
    'https://scan.cyberessentials.live/usersc/testfiles/eicar/eicar.zip',
    'https://scan.cyberessentials.live/usersc/testfiles/eicar/eicar.com',
    'https://scan.cyberessentials.live/usersc/testfiles/eicar/eicar.rar',
    'https://scan.cyberessentials.live/usersc/testfiles/eicar/eicar.gz',
    'https://scan.cyberessentials.live/usersc/testfiles/eicar/eicar.txt'
];

const macLinks = [
    'https://scan.cyberessentials.live/usersc/testfiles/maclinux/CEPlus.py',
    'https://scan.cyberessentials.live/usersc/testfiles/maclinux/CEPlus.sh',
    'https://scan.cyberessentials.live/usersc/testfiles/maclinux-archive/CEPlus.zip',
    'https://scan.cyberessentials.live/usersc/testfiles/maclinux-archive/CEPlus.dmg',
    'https://scan.cyberessentials.live/usersc/testfiles/maclinux-archive/CEPlus.gz'
];

function startWindowsTest() {
    for (let i = 0; i < windowsLinks.length; i++) {
        setTimeout(() => {
            window.open(windowsLinks[i], '_blank');
        }, 250);
    } 
}

function startPotentiallyUnwantedTest() {
    window.open(potentiallyUnwantedLink, '_blank')
}

function startEICARTest() {
    for (let i = 0; i < eicarLinks.length; i++) {
        setTimeout(() => {
            window.open(eicarLinks[i], '_blank');
        }, 250);
    }
}

function startMacTest() {
    for (let i = 0; i < macLinks.length; i++) {
        setTimeout(() => {
            window.open(macLinks[i], '_blank');
        }, 250);
    }
}