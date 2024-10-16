FROM ubuntu

RUN apt-get update && apt-get install -y git unzip curl

# 安装所需的依赖项
RUN rm -rf /var/lib/apt/lists/*

# 下载并安装 AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# 验证 AWS CLI 安装
RUN aws --version