import HelloWorld from "@/components/HelloWorld";
import {mount, shallowMount} from "@vue/test-utils";

test('page initiale', () => {
    const wrapper = mount(HelloWorld)
    expect(wrapper.html()).toMatchSnapshot()
})

test('saisie username valide', () => {
    const wrapper = shallowMount(HelloWorld, {
        data() {
            return {
                username: "lilian.pouliquen"
            }
        }
    })
    expect(wrapper.find('.div-submit').exists()).toBe(true)
})

test('saisie usurname invalide', () => {
    const wrapper = shallowMount(HelloWorld, {
        data() {
            return {
                username: " ".repeat(15)
            }
        }
    })
    expect(wrapper.find('.div-submit').exists()).toBe(false)
})