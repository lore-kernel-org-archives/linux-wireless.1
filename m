Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481256;
	b=Os5CHNh/W7beuWILuA/subhNOLpuKi+5rpM3IqNOypuciTUA+yImrOCh2NLGBYZdJk1J
	 NB5Af8zC4zhXgO/h2MiRVj+jfkIk8qFkbiSMDA1oSWKvYjfXNklc4iJjq9zEJn98X/XTC
	 xISQWvMDKgG+emUuMyywiroDuG1RTHJmpBfPklJUs/oWW7UNB2gfK8dgd9ALteggzh7c0
	 X+XWGBHHslLFWR9PeaT4Z2i8OEUJzPEXa/ptYBdkuDUIcRgb5G87y3C4BRXXpYU1tf2KF
	 EWxDpsI1A91te1dgk/Vb9qBDJxvuBOh0RzSWQ076XWqp227W07ZPcfE7w71ucirdI5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=;
	b=vFmP7sn04zjNXi0UtX+Zir9sc5TtROLvCOh+ebQr8ZuowPL6VKZaGVJ+6xIFLlu8JZv4
	 H6HavjwpmtXCpuALDe/OG4QJraSBaxl/W7PgYqpA4q5vlFSUPeHaROxoDTHg0aQCRVqhu
	 Ga7UZ98lWVs5SfnKCtc8qD+CZDorp+Jc1PCEzSW+QvbntKk3SIQuJyIgxFaBfD7sHpDDq
	 kGe7IxpuI2kDUzIuWfaVCGIjyluJ6QgOlv7GpYVfAATuU5/5MD74qkj5FjoDTb1WJX4Kn
	 BMDb9AgJRvt8ik7fsSJtuHu6Act55G5r/6XeZl3ch3LzdtqkzEO59edme1ts1fOsz8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdhJ9fGj;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F03606A323
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F03606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdhJ9fGj
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49412eb1474so2487107f8f.3
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481254; x=1795086054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=;
        b=NdhJ9fGjjWuPw5JCs1r/oejGbZ+48guIbj3iM1cXzfO1FBxNy79Qpadu88znt2na57
         V6XPIUY06/H5QzbGEmPkL1DUrcNXNc/Y2yucfPvuGHutInK6TDGftWz3UMnPDiNmpRcR
         F7tpYNqFC7KshAm6zpTPOpeB1SvBS/9TjnI0YpIWDAM2SvfGshqw2GCWDPRUCemU4weL
         qY+FeDonC/qBSaFr7omXLZVGWReOIAfiOVBF/kmTNMu6u7YKdOXXlllgE+vdUMYv0PQ1
         tFBFsTdVaAb91uK1iVhRN8+8sy0C8o/UtQpejG0LVSO0pi8rv5BUeVzXUHr2juJzDRHG
         ndZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481254; x=1795086054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=;
        b=pNU5AXIyjcKK0fevH4rz9RijWaKTvnFN0PR0sTVL1pl8O3q3/8GbVofdqAMN9zf8RO
         Q26cSOLjXcVhtp9+nnBDkbZCkHy4ozsqbmqhZKv9fNscXGxShbVtT9RK7Wnn+8Emr7+q
         xO7WJZz2+W0q1P123KiALbfjAsixDur759dHS4TIeJQ4KijXrFU2I2GnQ3SH8sKko1CQ
         ukY4kZHehm9+WNqCQmg0RpS+l3Yj1iNDvWElsQ8Btd8/1gTM5lwd2QGeYvphSwE/slUs
         GjNz0DRMbTHhm7mlh+hVzbFaOdskFpXNtjG4GKwPS1ELoCQLVxBabeiQCUzuXN6qXuUc
         7hkQ==
X-Forwarded-Encrypted: i=1; AL+hErE1d8Qr9ap/GxwuF04kuvPOynLQG1B+EAZOnqFM3zLGn84l/qefQq3Yr8hLZkqc+H/Sk8NGzzckCEsAIMftCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/09VUru/AfyskQVPa0NIohU92WY94gURpUEaaZE6AwPXgrO6Ot
	DcBS+uoSjfBz5u4EZPk5rDu0rCwJg+5FYTMtMTNtpMTHscqAAKxAhYMr
X-Gm-Gg: AYBFou2fUhRyVTXsikaUZqgIPVeiJVnzIFse4UA0xkaFVOLPLP2ZEdAGYrlaSy36uH6
	L6FMwMmK9oGgCg2vb4MXrRwjY2oJH5C6dz45VlAgtM0Z3C7lBu+tRXG5juc8dkFa+RqX6FailnA
	49kH1Ycpc3ivEBUrBrLkly4VnJZCAq0UXG2GYYDlv2pQTKy8VJ6R0oSiScpTU15v27MkEOqiZY2
	cnpsbD++Jhh+cIB550ZoRgWQont7x90Mq1B86HxbZIBNgi7Q0UQWmyN638ub3X2E+6XiGQ4xfv0
	HAVxRkk8DNJj83b6LrS3oqjFrOtW858lGuAMaIPnVYWjJi+v82IhSqGvSfJC/CPrjcTmkiSozwA
	82c3na0hDskrs/EME9Rpa0GCIPF0AWG9sqrofRCGfraxx09qJQlaNyHX9Umne75W3mw3jzS6IPt
	PzwtclCtPzaDosHh9Z/YQjgJsvwMO7Hepyur6HkWbLUyfWNUn91rr5dnPAVdalGI13hUaZ9XDG1
	rXGucGBEymNj2J7P0YSMkEpmqHep6zSURX/0hlxa85AjlngqAqVePdtrRsajYbudnsWVSdzEMaI
	FvcEWYdl8/dZ9YMT/unvGvzJia0AJAWqblXOrmz8Cw1UrAhICNaJxzRi
X-Received: by 2002:a05:6000:4011:b0:492:e1a6:90f9 with SMTP id ffacd0b85a97d-499c72712e8mr9950467f8f.18.1794481254158;
        Thu, 12 Nov 2026 03:00:54 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f1772dsm16217812f8f.31.2026.11.12.03.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:00:53 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] wifi: ath12k: disable and enable the CE interrupts only once
Date: Thu, 12 Nov 2026 13:00:05 +0200
Message-ID: <20261112110008.1229-2-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
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

ath12k_pci_ce_irqs_disable() calls disable_irq_nosync() each time it is
called, and ath12k_pci_ce_irqs_enable() calls enable_irq() once, from
ath12k_pci_start().

Without WoWLAN, ath12k_core_suspend_late() disables the CE interrupts
and powers the device down, and ath12k_core_resume_early() boots the
firmware again. If the firmware crashes during that boot, before
ath12k_pci_start(), ath12k_core_reset() disables the interrupts a
second time. The start that follows the reset enables them once, they
stay masked and the HTC control response is never seen:

  ath12k_wifi7_pci 0000:01:00.0: Service connect timeout
  ath12k_wifi7_pci 0000:01:00.0: failed to connect to HTT: -110
  ath12k_wifi7_pci 0000:01:00.0: failed to start core: -110
  ath12k_wifi7_pci 0000:01:00.0: failed to reconfigure driver on crash recovery

The device is dead until a reboot.

Make ATH12K_FLAG_CE_IRQ_ENABLED guard both functions, as
ATH12K_FLAG_EXT_IRQ_ENABLED does for the ext interrupts.

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4bb14a95aec9..c92821153706 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -398,7 +398,8 @@ static void ath12k_pci_ce_irqs_disable(struct ath12k_base *ab)
 {
 	int i;
 
-	clear_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags);
+	if (!test_and_clear_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return;
 
 	for (i = 0; i < ab->hw_params->ce_count; i++) {
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
@@ -739,7 +740,8 @@ void ath12k_pci_ce_irqs_enable(struct ath12k_base *ab)
 {
 	int i;
 
-	set_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags);
+	if (test_and_set_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return;
 
 	for (i = 0; i < ab->hw_params->ce_count; i++) {
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
-- 
2.43.0

