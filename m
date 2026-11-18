Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015836;
	b=bL5/n6hWYBFE/cnH4itkv4h3TV8Yje1UIf0kw90Y8coSS8BwhbSrTggLn+lG+eo+m/B0
	 y51hS3Gvap5NhNtaaHeV1WdjqhV3p7l17lmsZHClpJHkJAvz4q3kw8vbThygJMy2nqLbP
	 +Pn/aFh9WHHjCQvo6xLSbSagZRIv4Tgd0vAcZ2EM1OjZgMVT7hxh1j1mol5D9TWXuBqYj
	 s8GWmdlxtQZmtMimrd7dqYa0tSTlNz+DKDLfM9zc4R99cpl2iSgUGrV1uz/YU1Ta+8Mro
	 tg1Y0R8GH+8xYej+O0PM4w7f3qyWfGhav0n/CT2CotPpqVIFXGzhcmD64SUZ9cwkQWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=;
	b=XUdd7rlkUES2hwwOO6kmPifKjOisgABYMzxqG8Sf1wWS2k/rgMcM8yduVbk/cOGPRb3E
	 AR7nwurN9+rWVJvyrFJRvMU4lh4NTIbgmUcTOS5FoVPv+pFss4gtb1len1tYfZ8y1hfZi
	 slVUpq6EzKzOw6cGs96znE0lIWdFnEOvoLMxJH4tc9JcIf0kxs0Z6v1SDV5VKDF0pviGy
	 itpr3FNZq5QuzfGBE8Sh4/DfazyOlWYE7mxlW/cmWCLCi3f6fSqssbLS1/la/j4QNfBMZ
	 sRokJjbdUyod9FV+fnumBbNQE6GAgnS7TYEptgU6NwRIUaE5LGivy4bmdvBSYqCBV5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNjudTQf;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E631606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E631606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNjudTQf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-381f65e4e4bso1849096eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015836; x=1795620636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=;
        b=nNjudTQfUtItgoHK8wzcYX+IGFRMeXj+D0aA6Rd/YI+IqEGKHlmiwm0DTzxYD6tNIX
         y2UKX/gNMusuX4F3gWYEjtlN+8ppU+9qfpj41cvSgo+uE6MahlY3OMt5dm8/y7FSWxX3
         U6uURVKB4m7HyQAMo42tMpFsLlL5AZVaf936R3u+u1YnmTDmBtbORevicnDXJl1mpD3X
         qHDB4F04WBInTWkXwgwgnlQQR3dcIFIBMjVjqbKWs1chILOjZH91nWO3/5uePD3HNchS
         MHClzeINEWtGDd+pn56VlF6MXsYBD5VxNOG/Nah9zM/VCsYdbhL1xySD7oPug46gf3vb
         IWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015836; x=1795620636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=;
        b=kVH4qsRyjdCMVMjUX/KNxEFc4iaiOhvNBTJN4yv9DMjza04fi3E3lM8lQowOjN2Mom
         WiPkC2o0RCnq1NRNJaf/yzLDWy55Y0EXgDFko0qM1FyVWVuF7ttrApxLH4bcm8ilHzIr
         KmiT3xYHLCOMu8puk2hhMsvKf4whdWoaVrr4Sb+2AK72qcDaXKi6wLSGMihrx6pmy/Y1
         xY9+3VRuTTrJ2AkfbGSh4K4JV4Lm+tbY182+aKiUhWviOXX9RJqbQe0ZYYaaAx7IIf/e
         JSyCqUYmnZQG+dX3HLN9B5m+Ss4OJ7n5ub1c/G1VSU1AXJva/SgnuvOFJauM65C2dBWW
         IXqw==
X-Forwarded-Encrypted: i=1; AL+hErHKxOOCSH0AY+Nq6eXryzca6BtbwTbFmZvsdQYT4nioOhVTv5v5xisCF7ZINabGjE2fO0dOrb2W94hkMXFuHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kn590x5UMdbVwOK23ofvnqvz2YN4GQ0fnS6LZzmxbzwCjpuEB
	slG4EgPqQGDvYIKkaPQhM7RgReo6zCokWAYsG59D4MyZn0S8/i0YhgP2
X-Gm-Gg: AZFdTZcHRvf5V7DzQ+uHndfL650470zxLW+xIm/KVyxFsoo+s/ceLVnbneMDcA5+Mxl
	SWSv63aP02PgV3iN8lqnAiICYDOu6RlQfxUdazcp32dKejV+qAgUFZO+ZVb5QOInrXAaMDosdrb
	WQiu1QKMMekIFbEDTLV0kXtD9mYLBMw6hD6QNpBxRiVNiV+bou8I+LeaPleR76iWXUz8qEecGoG
	9nA6Ity+dW8xUfrUOeR1hKYxmdNBRqhXREZN+FMxvV2b4cfkwk8XgfkL/woIJMTUUKGo0y0wxLj
	a9GMjZ1jBheEz9hf7+xOjeb2qUTejYcEZIMcJLJJl+mInLMYvxEhRGKiuSHkZsc1IWemuEJe2nP
	Nt15XssXMLb6FJjoUo7yQnYFNkypZ7F31jFpNA4HxY34HNvmv4zVl5Vp4PmWPPRxfA26ikeI2rW
	DcgTi78TlVz7hMMVgffBqPpqhTLF2BwSdg8c9u2DRaf0/rk/0zcpIp8/OBtjnjTPt0Mgjz4O3P1
	tSZLxJqW2sYO1MzfveHV+auRCDbi1LWbuHL8I8CIq6Jh49vxBya9qUIqggRvHtd2TK3XDqCX9hl
	VOj3VcUCe/7OvdjrB+Q7KU3S5z9/E6wlrqehnedpG4+v2Ygcej6A3ceXnFc=
X-Received: by 2002:a05:7300:d210:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3828083e094mr2685513eec.18.1795015834724;
        Wed, 18 Nov 2026 07:30:34 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:34 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current 2/3] wifi: ath11k: free the regulatory state when the device is freed
Date: Wed, 18 Nov 2026 23:29:41 +0800
Message-ID: <20261118152942.62838-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulatory state of struct ath11k_base, the reg_info_store array
with the rules it holds and the default_regd[] and new_regd[] domains,
lives as long as the device, but ath11k_reg_free() runs from
ath11k_core_soc_destroy(), which only ath11k_core_deinit() calls. The
teardown paths that follow a failed start skip ath11k_core_deinit():
ath11k_pci_remove() when ATH11K_FLAG_QMI_FAIL is set, and
ath11k_ahb_remove() and ath11k_ahb_shutdown() when
ATH11K_FLAG_REGISTERED is clear. They reach ath11k_core_free(), which
frees ab, and whatever regulatory state the failed start allocated
leaks.

Free the regulatory state in ath11k_core_free(), which every teardown
path reaches, right before ab itself.

AI assistance was used.

Fixes: 61a57e51e46e ("ath11k: fix rmmod failure if qmi sequence fails")
Cc: stable@vger.kernel.org # needs adjustments for <= 5.15
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
that frees a synthetic device through ath11k_core_free() after a
SERVICE_READY_EXT event allocated the store, then reads the store to
see whether it was freed: without this change the read succeeds, so the
store leaks; with the series applied KASAN reports the read as a
use-after-free of the store that ath11k_reg_free() freed from
ath11k_core_free().

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..90124a826088 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2021,7 +2021,6 @@ static void ath11k_core_soc_destroy(struct ath11k_base *ab)
 {
 	ath11k_debugfs_soc_destroy(ab);
 	ath11k_dp_free(ab);
-	ath11k_reg_free(ab);
 	ath11k_qmi_deinit_service(ab);
 }
 
@@ -2734,6 +2733,7 @@ void ath11k_core_free(struct ath11k_base *ab)
 {
 	destroy_workqueue(ab->workqueue_aux);
 	destroy_workqueue(ab->workqueue);
+	ath11k_reg_free(ab);
 
 	kfree(ab);
 }
-- 
2.56.1

