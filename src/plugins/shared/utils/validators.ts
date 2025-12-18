export function validatePhoneNumber(phone: string): boolean {
  const e164Regex = /^\+?[1-9]\d{1,14}$/;
  return e164Regex.test(phone);
}

export function formatPhoneNumber(phone: string): string {
  return phone.replace(/[^0-9+]/g, '');
}