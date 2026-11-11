Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430117;
	b=oVe38MM3gBwdcnQGWsNSshQDcDp1jvcrEDFvfCwp0WaRxbd0cOlJfpTyDLTyxHr9F1Qm
	 4ijJ1dMkoh5Knb6VUAWYlUBVK64lrwVq1EenMqIFAOrDDSx+b36lfucHOKHCVStKfQSUN
	 lxplzuTyD6OmyIUjO/+B7J7iFWPbeqyHz3rCJPtdTfDKJUZrINCDLZG0lfCelX7CtoTbP
	 b802kfbQNMYq94nD9tdz7c7r3kc1wG7hZOKycNWctDzLLliH85S1wq2Ps5xvial1TSE+6
	 DEyycsVsUUCMNpEV+2O94EuBcTFdyYf7SKf3wpYAvVoDSgia3sW9nmSz7sh5XaRLb6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=;
	b=2QbGH7GH++hkcH0sUxJSkLtOKhyei50fNENNGDRTk1TGAL10/SXv6N1OqGlJlKf/ywRl
	 ar9bjHZKUuJBMaKDgqf6KkmF5Ne8BCbvjBAbDCvMz6vbrNjkLF3c3NYe5kH5xFIq8Ss9K
	 PaJu3JvO1MuCP5gnmTnYIyXf/i+DrzsL7ctU7DffPioeup9blNtkJh7Vw1Kbft/cGRq5b
	 zU0f5ATF2K4bTmMGVM65wSYoRZ1ElCQYCiilKIwKz0Ytg7HPWhK+M4FJcqZjgjJl87/MB
	 jWP1EPaDpYlnpeuNJ2YXHfE+NMhtl+6wplS4M8IdiRxU8T2i/jHu29FUajHiH9cEHcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAzlYn1S;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC98606A321
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 20:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAzlYn1S
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso26188235e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 12:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430116; x=1795034916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=;
        b=yAzlYn1Sm9ckYmfdgpgSMaY7CxevFGTQY0xRQ+HNtnVifbXT6qkTqts8ZLWCQLzIey
         0yu054+3aQ5KnsmcKxCQcNcqDArGWnOiPEEjn5Sg7Ni4lwEdZc4z7slBkIQle4Z1rCmc
         MUwHN68L/6pwgGxFRro5voYsBibVqB/d6qE8Ghu4Oefc6IfknySLI95lqEgECv/7YI25
         yCHqAlcBhD5M4c/28q4+X3pYJUBpp60O9jF+yVSxy7XTstNb9xT6uuOv6ffE0K+i5bgO
         jxb47SeBXWn37oHvCgPyzNb+gyq7a/Gqi+wakKtIILMutPW3sdRGad21TYDH4L+33Pbt
         c3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430116; x=1795034916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZYnbqYkHqkELVkKDLojhWjQ3BIxvmQ0PHO33MEnp+4=;
        b=zljxKJQXMFqmzgm9wlEhfMpIzyYBpWb4ld97+HRMDawejtapMoK7QC77Thmt1ORthv
         PlvwEIeVxNWdRiBe1GKOp+6zYpiaEtOE0OwnU4HtMx1qxl2FpYOdySxDzm5kfn7p5dW/
         xS8r3jV8OYVWVM7K2sVaAawQ9dpqL8mF/YS9r4bDACbA9JCM3l8zPftKSMSOA5E8XBp8
         E//+SCRunNU0GNPnxuIpS7MBsPsGUL+LwxgS6qXVTLQGVNwpiEO2CMQwIuSmvu3q7HJM
         BFRex7BlSfg18I2X91POCpN2ZCMMIdvE/RcN3PAF2+YVC99wKeIIr2rw55ncXfLf8gWw
         63aA==
X-Forwarded-Encrypted: i=1; AL+hErEL+PvPT2arS6FKBI2Y5qdC7NHLhs6e35Xjit3fdxS4fteFgCBqj/q59gVOiszIlOO/BzS8Lr4aYyoxS7EvPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z94GPuvYWNrh/O8cJHA0YGPLogqDJcCT2DHJS4GYSbVM34td/pv
	b4hByCP/m5dbijYG7Xi4NWEESAxe5Rh5PNXTBgfLmOScOx6kuecEmMFf
X-Gm-Gg: AYBFou0Z4huWgIpSJMfZKOGVe7z6tdCh5MKcs2h06PZL0TZepdauZwrlzfvErKVFoSP
	SXx+pPgP/HHMmO/lqO91RK5N9oZ8ORfCrBOtb8j1xhTRjINAPpF9EAhFPO9k+g264nONSvW6/fD
	c+lUa/FazXbsCFBhVGGW+G8m7zKnE2CPbnYPU+Lo+uQdW/Z2Wk+bY8sI64STJZHbGl5cN0NExqE
	0zDq3F7bBJpfXSmB58IH+Vu7EGSuqN4K8UQUO4uUQ9+mG3z6/uzLOaSew0TiLFT3TXQ98sGQsxa
	g7XzNFUckk7lMDwh5BLuo/1Lb9hJCmSZybqvk4gHCvqFJ4GzcFCNaHsn3AN2COiRGghWVH9L5cW
	/yx1B4ONevcwItVMueHje6YHF27QQo5Zn2s/E9CXzNvr2a8eB6IvwogoybBMg9X4okQOLigqEMv
	jzako4y6QhnpQl4FyrpfWk0sTe+VXWvactzzFC342vvYaDPwQaospK8rG8BhweA7CRdm48qicyu
	wP/IIlaseXAzutTBN6u9/cS56qSbcKyL8ZJ6UbsIcnWsiPzPbY/YSkyoFLSxGTq6C6I+FNPQUvK
	4KMpqoHmh7dQOe39VD/urAh8Wtv8Fo42KYtt+C3AkKCbdRI0D6s0+JulJafDgdRFJpAOH0h5YdR
	rrdbVRgQ0AWF7O8tpPdlyc3Q8aK3FiPKX8hGi3QEdYYbLfNiQq3dmNv8C9j+XHJjcnCSyPvmaIh
	Iq++q0FkwR3J2VKazeeaJ0UNPg
X-Received: by 2002:a05:600c:3551:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4ba0938b879mr61055775e9.34.1794430115719;
        Wed, 11 Nov 2026 12:48:35 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:34 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 0/2] wifi: ath12k: PPDU stats user count fixes
Date: Wed, 11 Nov 2026 21:48:21 +0100
Message-ID: <20261111204823.88785-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This is a resend of v2 without changes. The first posting [1] reached the
lists on 2026-11-09 but never showed up in patchwork.

[1] https://lore.kernel.org/r/20261109225355.23161-1-gsustek@gmail.com

ath12k_htt_pull_ppdu_stats() rejects PPDU stats messages whose common
TLV reports num_users == HTT_PPDU_STATS_MAX_USERS, although that value
is in bounds for the loop the check protects. QCN9274 firmware
WLAN.WBE.1.6-01243 sends it in BE MU BSRP trigger messages addressed to
two Wi-Fi 7 clients, which makes the warning fire on every such trigger
and fill the log on a two-client AP.

Patch 1 corrects the bound and keeps the warning for larger values.
Patch 2 fixes a related off-by-one: the per-user slot finder and the
per-user statistics update skip the last user_stats[] slot.

What the data shows (diagnostic build on an AP MLD, 5 and 6 GHz, two
Wi-Fi 7 clients, 2026-11-02 to 2026-11-09):

- Every message with num_users 7 or 8 was frame type 25
  (HTT_STATS_FTYPE_SGEN_BE_MU_BSRP) and carried user TLVs for exactly
  two stations, with up to four user records per station. num_users
  equals the number of user records, not the number of stations.

- The same firmware advertises max_user_per_ppdu_ofdma of 8 in
  WMI_SERVICE_READY_EXT2, so 8 is the largest value it produces.

- Rejecting a message has no functional effect beyond the warning: the
  user TLVs are already stored when the check runs, and the per-peer
  statistics are applied when the entry leaves the list.

Changes in v2:
- Keep ath12k_warn() (Jeff Johnson); only the bound and the text change.
- Add patch 2 for the slot finder and update loop.
- Base on current ath-next.

v1: https://lore.kernel.org/r/20261101203718.60679-1-gsustek@gmail.com

Goran Sustek (2):
  wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
  wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users

 drivers/net/wireless/ath/ath12k/dp_htt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.56.0

