import zh from './zh';
import en from './en';

export const defaultLang = 'zh';
export const languages = {
	zh,
	en,
} as const;

export type Lang = keyof typeof languages;

export function t(lang: Lang) {
	return languages[lang];
}
