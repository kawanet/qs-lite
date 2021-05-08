/**
 * qs-lite
 *
 * @see https://github.com/kawanet/qs-lite/
 */

export = qs;

declare namespace qs {
    function stringify(obj: any): string;

    function parse(string: string): { [key: string]: string };
}