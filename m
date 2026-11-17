Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794898659;
	b=M4mTWlds1C47PDIhg2Sb8G2Ns3x5OMOOqku4LFxWcKD//M7+7crWcN/ewLHO1+XYgLPC
	 BA9ulmCKuQrLrr0f28uaxE6offsyRcfBjf3lWVo66lwG4w4e6a8w4QXYAm2OloPYhQ/GW
	 nFLRo0x0w+fMxhs+uAUmzs0LEikz0R2wNtTgFTmJ+pvB5PbXUz8gWY2RbqMbuATpv7kGC
	 q6swxWYpBHNhvrQfEWwhJgcpR5a/KOc52kXzKFYUKjYKbq2xdpQdIrMiojfQQj+LDkyYo
	 EfudK7xgszyIzTRP2GK3FjZo1fiAZNztzWxDboPY8Iu16AZ9+FGmWeMC2ROHIVFCSlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=z0MIPVZXK5dLXw1tyO6HXqNIWUn9zD5Y4K9IC8LKwB0=;
	b=wZO5h8Re6rb4q50yf3TsTnedn7XaqXHQLpQic9vaJuh9P6Q16f78f/Nvirainbl0PKRU
	 ZOF0Q9//YqDJcLUrQOUrgQMnnk8BZJ1Aac0yDSR10VSfL/gqNVe0lBueFea5830gCHit1
	 OWR9sJ5Z3d3heSwSmIvOnN81+q21PDfH3Nfsehhbux6ag0WDZmJ+cBESY7UU50w0dTV2d
	 koKXEQB5tI+gJg3W+auwmFQ5VTsCDh1ufV7FM0MF9QyyuOvwclyxC/tk215Ix/nLo2GE1
	 IFNrqRzLMDZCkKhduXSQo7fTtJ/pisE2TyWG/DzOGYVVndJ75eWZtq8avf6gxEmzoUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY0eiq74;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F98606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 06:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY0eiq74
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so4609998e0c.3
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 22:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794898657; cv=none;
        d=google.com; s=arc-20260327;
        b=chqgeZZhweMjuOsdkWLE7y30a54+ql2uRuAAu06/E7jYuwU6vhtEWCNTNurDdDaw6Q
         TK5Qb+PrTfKtNmvZjWHtA5h5riJBw3t0Z9ILlwrmQNW6+jefBlvAM4p4cToU7cEF++7m
         foaK/pGEmM+e/33KIg/jqgNGhV2txiZ3m5TIhnsmRV4qB+8Xb0xd9g7B6GmraB4g9k4j
         IxDceYcEO5eKZIm1qMYtlAcJSrmKLbE/fF1urxytIoF0eWQfGncY9iCthe5ICA97vvmv
         YHyNkEcpPdyWWMRVjCpzu6+JiCVFLmlEqFhJOQfkAwCCj0lNd76KoGQnXVJfy3zcV1gJ
         6cCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z0MIPVZXK5dLXw1tyO6HXqNIWUn9zD5Y4K9IC8LKwB0=;
        fh=zMzxqmxqUWEpnU7MIKMU7kFbijfoYEh94g9A6LFjdIE=;
        b=PSor3QJTeybzcbBgvxLn/1nRoLkr6WSTsOCHZOoN5O/3uBxUlcEygzpXumPnr8djm3
         BjHnPa9rBNBhipkc0+SA8kHAvcZ0q08rxHqcREhCptgoEZ1YEqqJM+BAGj+q9iN7lYmm
         Ak8dHCNO7r+yLic0Ud8uKlHpLGEbTQR+szKUFrACVPYv0lg0zxLtQ/WEm3x4BUCa63XK
         viNishocs89tE0CwtWoPbfwDBAnTotFq2Xd5my4s1oHFp6kutWXJO5jZR6vPPvpFiNRv
         ZeTGXTRzbWcSM5c+AQ45lbBRMpVxYXpSZcKGDpiBZw9nqw71esMZpUzxzCGKhUidjsAm
         1YvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898657; x=1795503457; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0MIPVZXK5dLXw1tyO6HXqNIWUn9zD5Y4K9IC8LKwB0=;
        b=CY0eiq74VcJRFIVfoOjuV+lK90QHm+gO3P011sVQGQAqaI+JD0ix4FZ8upUa/bnBFE
         Gk9Wid1EFxyqsYUzs4LmMsE7Eq0YGeaVO90C64fdBI17RecHY9p6oQqK5z9huTZC8Qg1
         sR9u9+bPrBE/+/ZwdHoZEcrMNAK/C2BkgoGLsQWXwOu2ee+FX2Z7loLXyQ7cbBmPLHLj
         5e+AWxtJT65Mf/4Is7NNBjxCT9Azkd7wnWfXRp0o2tLRQoywHsXtW8ZS1N9NRiqvEj3+
         Ox+6og2tjGCmJkMdyB2/73cmoI+3NK14IRSmNYEMU/kSfaGuJSRyJnsAto1JP5MaPsEQ
         lrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898657; x=1795503457;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z0MIPVZXK5dLXw1tyO6HXqNIWUn9zD5Y4K9IC8LKwB0=;
        b=sJf7i5w8fsNmrfQnJOHAQCL9oVA+QCxSsEl0ZRaRt8jejuXivQXLl6dR8Xujun8f5j
         pAk8UsuLXkUn2XLvJ8v6O9g3lEAKpZZs9fq2jIlSuJ3aGTef+b7go63cGLwIrVTEwvth
         lXWKzr51trWUtsmuIUKBhM66DrcrLfFhb2BzoMWiV8GKlWeQF8mUKqIwfH2bk5jXKfHv
         kV9wrPHrWVY8a1PLTdNvJydtpC8h4tzCGXDj9m6YuuHrpeE3seX/d+MZajJ+I1uksZAH
         8ub1410rtgGRmWL1IVZgthrGz/AD9dqFFKSPE+RoVy/T++8FPGan5jSSPTW0bLQjm+2U
         LERg==
X-Forwarded-Encrypted: i=1; AL+hErHiKFWORj8tuz2qtmSpUEyPta0IVNY+laQLADD31o02MSF2nyZ55lIHwoBW/pzFYZbX/sysj3Djf6ZwMA45nw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JR8tioScF/2j1wzeB0RS4NzQs+8fRD7mFdJuKWF0IzaKynFpr
	QinynB0vKJM7bKAHsKjqNb6DZuM6NYqVhL2XDm4Ekzn2DGlOEjx8m62HsMVo9rBYIHFdcS0rcYw
	oqrkJrvmegcZtW9uxNf/IM4tuyDX63b0=
X-Gm-Gg: AYBFou0F7RH2HM05pr8nWitcMY9v+sTphCcRDCQNt04mzW/y4PqeymXQDlIvSm/25C7
	iqjkpBvGzGRZaXY/c7i7N8b//sjzx+QiEEGLE7BCBcJd5kln/UPKmpL+tOTSNP7BOxpV+316M0n
	F4FQbJVX5iDVCppJOsjX12eRAVWVpSLdk/By2R2SBQPIGDJaOFBPsUAzT9AgwMlElYM5TM3pm78
	TVZKiuG0xcxKKcEnDx+kluDe/60CGtUyKfiYYJ4+6xAGEn2y9hmmI9LCD31kB7vhuOeNVKw4Yxq
	pYqBILGZtS+7+S7mdx6Pchw4SxcdNcGwtCjHE0hoga+kM4VYcNSDo/NoJ2NF45WzEFOvlTZKLtW
	Pw8U1lto6W4K7MT8wRnQmcVd8owQ8hmdLDVoXfzM+7dL5ZkCoOrndXpV3BQ3yMoNfHskAXaroXl
	Ux2WpuBCzO1WkDDctB
X-Received: by 2002:a05:6102:6446:b0:7ab:af4a:f2f3 with SMTP id
 ada2fe7eead31-7d64d85ce1amr5054681137.26.1794898657452; Mon, 16 Nov 2026
 22:57:37 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
 <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com> <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
 <243aa8d2-ca32-4827-8675-70be02b653d9@oss.qualcomm.com>
In-Reply-To: <243aa8d2-ca32-4827-8675-70be02b653d9@oss.qualcomm.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Mon, 16 Nov 2026 22:57:25 -0800
X-Gm-Features: Aa3M54pFYlC-Sgy5IGuVMCgESJNKj3RQrP5QPbH7nXAX8LDwNvkwZk57mpQ5SL0
Message-ID: <CAKobHXA957LGe7d7+NdXrXWNYrF-7rs7WUx_YVS4Ft4q4kq9rg@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On 11/16/2026 7:51 AM, Jeff Johnson wrote:
> Please check:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=9d8c2294a34e5ec38b674a8a1a5223522cfe3842

Looks good to me, thanks. Reading rx_duration and tx_duration in the
same critical section as the txrate copy is right, and the filled bits
set after the unlock are fine.

Two notes on the commit as it stands:

- The Tested-on tags are from v1. The two added reads are reviewed
  only, not run on the boards. I can run the pending version on the
  IPQ8074, QCN9074 and IPQ6018 units if you want that before it goes
  to ath-next.

- The sentence saying the change and the message were written with an
  AI coding assistant is no longer in the changelog. I'm fine either
  way, I only mention it in case that was not intended.

Thanks to Baochen and Rameshkumar for the reviews.

Christopher
