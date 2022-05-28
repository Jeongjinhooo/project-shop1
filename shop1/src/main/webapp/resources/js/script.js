const $mainmenu = document.querySelectorAll('#mainmenu>li');
const $submenu = document.getElementsByClassName('submenu');
const $subli = document.querySelectorAll('.submenu>li');
const $slider = document.querySelectorAll('#sliderinner>div');

console.log($slider);
console.log($mainmenu);
console.log($submenu);
console.log($subli);

// 메뉴 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

for (let i = 0; i < $mainmenu.length; i++) {
    $mainmenu[i].addEventListener('mouseover', (evt) => {
        $submenu[i].classList.remove('hidden');
        for (let j = 0; j < $submenu.length; j++) {
            $submenu[i].children[j].classList.replace('disno', 'disbl');
        }
    })

    $mainmenu[i].addEventListener('mouseout', () => {
        $submenu[i].classList.add('hidden');
        for (let j = 0; j < $subli.length; j++) {
            $sub[i].children[j].classList.replace('disbl', 'disno');
        }
    })

// 슬라이더~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

console.log($slider.length);
let index = 0;
setInterval(function () {
    if (index < $slider.length - 1) {
        $slider[index].style.marginLeft = "-100vw";
        index += 1;
    } else {
        index = 0;
        for (let i = 0; i < $slider.length; i++) {
            $slider[i].style.marginLeft = "0";
        }
    }
}, 3000);



}