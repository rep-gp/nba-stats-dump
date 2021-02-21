export const titleToSnakeCase = (str: string) => str.replace(
    /(^[A-Z])|([a-z][A-Z])/g,
    (match) => match.length === 1 ? match.toLowerCase() : (match[0] + '_' + match[1]).toLowerCase()
)

export const changeObjectKeys = (object: any) => {
    const keys = Object.keys(object)

    keys.map(old_key => {
        const new_key = titleToSnakeCase(old_key).toLowerCase()

        if (object[old_key] && (typeof object[old_key] === 'object')) { /* If the value are a object too */
            const subObject = changeObjectKeys(object[old_key])

            for (const key in subObject) {
                object = { ...object, [`${new_key}_${key}`]: subObject[key] }
            }
        } else {
            Object.defineProperty(object, new_key, Object.getOwnPropertyDescriptor(object, old_key))
        }

        delete object[old_key];
    })

    return object
}
