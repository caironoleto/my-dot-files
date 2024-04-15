#!/usr/bin/env python
# -*- coding: utf-8 -*-

import string
from random import randint

"""
 * Essa função um número de Pispasep válido.
 * @param {Boolean} formatar define se o número do PISPASEP deve ser gerado com o hífen.
 * @return {String} PISPASEP
 *
 * Regra de Formação:
 *  PIS/PASEP - O dígito verificador do PIS/PASEP é calculado através da seguinte regra:
 *              o número é composto por dez dígitos mais um dígito verificador. Multiplique os números, da esquerda para a direita,
 *              respectivamente por 3 2 9 8 7 6 5 4 3 2. Some os resultados das multiplicações; calcule o resto da divisão da soma por 11
 *              e subtraia o resultado de 11. Se o resultado for 10 ou 11 o dígito é zero, caso contrário o dígito é o próprio resultado.
 *
 * Por exemplo, para o número 1701209041-1, o cálculo seria:
 * 1x3 + 7x2 + 0x9 + 1x8 + 2x7 + 0x6 + 9x5 + 0x4 + 4x3 + 1x2 = 98. O resto da divisão de 98 por 11 é 10. Como 11 - 10 = 1, o dígito é 1.
 *
 * Ex: 5936677542-1
 *
 """


def geradorDePisPasep(formatar):

    # 9 números aleatórios
    arNumeros = []
    for i in range(10):
        arNumeros.append(randint(0, 9))

    # Calculado DV
    somaJ = (
        (arNumeros[0] * 3)
        + (arNumeros[1] * 2)
        + (arNumeros[2] * 9)
        + (arNumeros[3] * 8)
        + (arNumeros[4] * 7)
        + (arNumeros[5] * 6)
        + (arNumeros[6] * 5)
        + (arNumeros[7] * 4)
        + (arNumeros[8] * 3)
        + (arNumeros[9] * 2)
    )

    restoJ = somaJ % 11
    subtracao = 11 - restoJ

    if subtracao == 10 or subtracao == 11:
        j = 0
    else:
        j = subtracao

    arNumeros.append(j)

    pis = "".join(str(x) for x in arNumeros)

    if formatar:
        return pis[:10] + "-" + pis[10:]
    else:
        return pis


print(geradorDePisPasep("0"))
