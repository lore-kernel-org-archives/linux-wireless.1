Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015812;
	b=BGJkMP5CKYMK5V1Ljh7aHuA3M6nlZDdapZd3O/rY1/264UL1Oo1kEoIC+of2+JHTeE9Q
	 m9JHQT3qMTS3GaANldr/qZRK50Fw8PHV/v7mTcAFzwIdre1A4vcvm16vmYh85Q86/tliA
	 liHsXLdPDeDbKBtvLqtkrVtUvOxl/+ufc1PQuUp2iB8aRyU7IxojN+L7O+1yOEScJtk2t
	 tQpeak8+O5TzEyK7v+jbTOvjxJDVY04gnSYChTRwRjge8uSAygJbYCqVy9Oor5zXIZ+Xh
	 5hyxbG5Zc9IGs6d9MA40nAqiKLQY+llajbV7z62DHBGG7ZaLSVEkZkjc7EFwj3jmyoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=;
	b=zTJHYN5B8mOMB2784FHqIJXHZ84YSlW/xc+E1Etkz5nlmu8M/xtw8PfzGplw3uEERN+l
	 w3XcKOxfNHPemPBWYcB2x4QrURTfulFuuWfZGXtimZw3abG9H/f8RZhQAoatobdODOu0U
	 qFldpOhziGl+o/krymITuIYFp6PvCa/lkHSS1G0Z/DqW97Uml0Xrbg8BOe8flGXKHZUlC
	 D0rhnyLU6oTMkH0mp473acSdr/v11G4+rtNmavdjO7ZY+8THz6h6VRmTpK7U8XkQO9YdA
	 TYbfaXPP20pb8oPKPJqqSoe63DV+44uAWOPBHbxhxYEkwq2/4JNJIsci4+7AJ7edmAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBBtvYWC;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BC8606A337
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BC8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBBtvYWC
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so3064065eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015811; x=1795620611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=;
        b=VBBtvYWCkQ+uwNlm145G4Om9lraJpse8fcze2caHbJrErClBJ7lIqbagIsExxitUxs
         biyUa8H1QMmqgmqHN46h04VxX6i32F1KHOj++0arLGH60Ok8y7K5nrGWS6Jlvm4km23z
         ukUrlm86ZPPRm/+pFbCvJ5WLNkRA+DnTF4fi46n4bQtiyRK2GqtGb6LWuMChmV1MPTrh
         Niw7yUPlqOGIElI9h57hz0Thv2myX+EFzOEvlb+vgj7XHBEUL2/Q0QbkA9scRE/Jup2n
         OhoWqIGdd0CcRQDYG1MrYiEtklNeq4662N0c/qHoJRJrF9tnK6W3U7MnslV7BDiy6owF
         LzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015811; x=1795620611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHS9B+0BHde2X4jb3Xb3RONvqSby0IcB+XScTmz0upM=;
        b=CeM+c7NQtbfWUTKTQ/NJBooBIY12dssDVWzvSDLuCeO3afuB9CDL8vLcaiL2x+SmPO
         Fr5gj+4rDAJyB4Q2DGwlm3WNCube3N4JZME4DFcSIt0qP9nkqTgUgItGoTn/LIBBtn+H
         qctYRU/DijeUP06gPuyjX0AZ8rBR2DbBE5Y7psqjN8gDXnoL5bCEbPuvFbo3TLQq/8dt
         QoeobWGPEucOQwBJpGLuFMqiUtPbWUHPQ925SoRBjKa4IPlGYBNWvDH+zKp+z9HKTJCx
         glDG2v8kspGzYtzV9cE2av0V+JZd9nRL8tLBvfh87mSrAHcq5yvCvNmHD2+Kyga6iJ98
         RKFg==
X-Forwarded-Encrypted: i=1; AL+hErHP0iYQo54QSjgd0zuh6mivM8W2mRHWC2//Gnp0zXzCn+UVhchLMJFspAd64qa4WBa2xvYEtQoHYamHorjhiw==@vger.kernel.org
X-Gm-Message-State: APuU4Z82NHT2sWoyPfu5yLB6R/Mb5+vr0NBe3rNUbZlNb63VQld7SCWf
	MCFdJVtQ3gnu+L2a3MrULrfe/tn8TaVaRZEDzrxTe9+N6WlHZW//6OBQoN5RlndxeoU=
X-Gm-Gg: AZFdTZd//Gq+aPdp2SmntcUhJYgIV8O2cni+/fbz5nidRE6NwErEq0CxWo51wZwGJHA
	+ldK/PoozHXPU8p2EtmZ/ckCOrrhLel0Nxk4CsPOBr9QR40YWo8fAvRxLFYJ0c9lJhPl9+6D0Xg
	TNjm85Qs0HpMHoDOSDeId7NpdNViM5cb6VNoLXG3lc5d2en98J+BE5N45RnbtnYbg1+Rq6Rm/p2
	2T5iGDtlsjE3puCFUOtIWQj35PQuUyxE2WbNN5YzXn0nXBfjQbIuCeUQ+jnF9TPHoyqyFeMimft
	+El4U4xaI+YE0SDAvBmxcA8kOLI7RUOk3Crcpmlwrqr2o/UMzng+LFO1ViJLOV8OD0BQgko9fBQ
	p1sHGfCH5E29JNYqjMcaYLlXwzH0e97Kr7rMVEJsTm9lUFVxW6VzGnMW4kYnHR8BFj5fEmNHsSp
	XvPtfYoUBGgiYZezZq5qbWfiNVw12KxNIzFdmf7hdxmru1xn4fbWeYSKSvusrN6dhZsAFCA7naA
	CMA3IsaNaZbMF8RC3tKTwAXKS3DzXHjJ2i9+zHcrHrGGvKHSoDV72sskcZn87i0vOr0e/jo3ceM
	o3g2MlLIild4feKb9OmYdyxPri2L529ink0tGPuMuIp03jrPPAc4NM3/rvg=
X-Received: by 2002:a05:7300:50ca:b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-382803787demr2845493eec.23.1795015810729;
        Wed, 18 Nov 2026 07:30:10 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:10 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current 0/3] wifi: ath11k: give the regulatory state the lifetime of the device
Date: Wed, 18 Nov 2026 23:29:39 +0800
Message-ID: <20261118152942.62838-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

ab->reg_info_store, with the rules it holds, and the default_regd[] and
new_regd[] domains live as long as struct ath11k_base, but their
teardown does not follow that lifetime. The SERVICE_READY_EXT error
path frees the store from a transient event handler, and the remove
paths that follow a failed start never call ath11k_reg_free().

Patch 1 lets ath11k_reg_free() cope with a store that was never
allocated. Patch 2 moves ath11k_reg_free() into ath11k_core_free(), so
that every teardown path frees the regulatory state. Patch 3 then drops
the free from the SERVICE_READY_EXT error path. In this order no step
adds a crash or a leak.

A separate patch, sent on its own, makes a failed SERVICE_READY_EXT
fail the start instead of letting SERVICE_READY_EXT2 complete it.

Zhao Li (3):
  wifi: ath11k: don't walk an unallocated regulatory info store
  wifi: ath11k: free the regulatory state when the device is freed
  wifi: ath11k: keep the regulatory info store on a SERVICE_READY_EXT
    error

 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 drivers/net/wireless/ath/ath11k/reg.c  | 6 ++++--
 drivers/net/wireless/ath/ath11k/wmi.c  | 9 ---------
 3 files changed, 5 insertions(+), 12 deletions(-)


base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.1

