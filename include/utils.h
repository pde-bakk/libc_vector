//
// Created by peerdebakker on 14-04-21.
//

#ifndef LIBC_VECTOR_UTILS_H
#define LIBC_VECTOR_UTILS_H

void	fatal_error(const char* s);
void	*malloc_wrapper(size_t size);
void	*calloc_wrapper(size_t nmemb, size_t size);

#endif //LIBC_VECTOR_UTILS_H
