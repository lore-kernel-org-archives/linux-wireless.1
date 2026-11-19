Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092574;
	b=ajGseGL+0Yf7CCzcgc1Cv4j3haJlweOegysT0RTiEqDx7PKsI6lQJE6AhO0+ZgchVaej
	 T+IMqlOCLWj8anB2NMAQ8jvosVMpvS9EQkHIwfOQsYKvNoqdT41cSjrd3Gc+pMNygnrrR
	 kUICXm5bLO+W8DZiqWuEDZMOFHajo+GOSNW5kdihgD7McmOaRGrz2yDVfxViTls9ji/0a
	 X3n6Ke/+vvX6j6zP0ei0egIe9IaKzdAFX1XHJI83BIqc1Dlgim6C6D76p6lgsNZg0SmHv
	 XMp5AXPrOqcPpE/vpKn7dpic5CVWQD5Ggt4kQnbl0/5Q/k9xoiYb3YqDyxH37Xcix7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jl9oyBMBlY4JXOrQAW23CuXlJczhQJcy241+h238qgg=;
	b=GQYk1NPTdtme90KGLDkJ72KttBSxlCqO2IjcI/yipDxjT2xHv1pQefQtBrJObBTBMNyd
	 WbwyAxsmquqWrnwOmIfVSOp8yFJXLJn6vDohQQ6MMgygO/90z6h88ZZhtTjaFgWOxa4F/
	 2cK996H500hrOeAAnIAsYemxk6aYWiMPZNrPQbN0e0PaTn/3/Ebp2B2tuajRJtz5bK/Zd
	 ZIxAqZ9y/QQ/Rj4HyzLPJc+qSViWDI76kJHDUFeFU7bSeln6Ob22DGdHHzDw9T+SsFqmu
	 5X2WiKPwBUcjlfFV1u5coMKUhWvdO8ibKPVB7sehkwaQUVaeOC8gX5/oKqX2N3ncEbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHPvpXlb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1FE606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E1FE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHPvpXlb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-381d542bc29so4017049eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 04:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092573; x=1795697373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl9oyBMBlY4JXOrQAW23CuXlJczhQJcy241+h238qgg=;
        b=qHPvpXlbIhX6l5QoRi3WKlIpWEpfRc1OTafFYafo8n1ZlnpmXKLNMPRPXKNrmuufPp
         hzIeG09r1p0ytIZrctJBtcxF4iErP1nVvzksg59PYdnjOIlbEZjpSKWlZoqEXiUhX95a
         dw3a7z2+9bvdYH+t6i6J6+mlpZtFQhoFarTQayDm7paKto2P45Um3dtPYTv+ZwTeaBox
         GeMAi7y8o2h48ljsXlmRei1G07l+vvPdLPI1h0xqajBpQ2NrzVSukAW29/o4upJiQxeM
         GrQ5BXdrQ6C4yTp6GxXhbJRk7N4WJouEktR30jYIrW5JFMbXRZ0C+oZiMQC9wNfdbNpt
         OoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092573; x=1795697373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jl9oyBMBlY4JXOrQAW23CuXlJczhQJcy241+h238qgg=;
        b=uVaiiyHuV1xiA1MSFGE5mBDyQdi+eoAezjCcninIrL+cZPb3Q2C3rf62+HYKjvd9VF
         MJJb9jxNbfbQ5s37jld15bZ/mTBJjc/M7WoX7PuIKpPo79TBM9g7Wa4Nc16nCck222av
         AcbSb9LeMkd+Wp+xrBG7UzZIpEW1VmbLCqPm/2wVv4ZjWYfRoePzgUJOun4fYWlrW8KW
         +JZ+aQcX1FhjPpeMw3nkNVATTQb3pMRCpfInwamkefzw6kFR5HdmtRqoVxtb8bSEDxD1
         96bUesvyL5IBRek77Urvg/kCty+f6DphngaMR4UwiEwhx532zW1kfb/XIPN//EL7MPc3
         Af3A==
X-Forwarded-Encrypted: i=1; AL+hErEcIUnBnSn0bLtl+fpGxmKUpDK2mqcqYWKD4cDp/pPJzd537mADqKMcl17ED1kluj/3HW8l3Fq4r2wMKbw0Jw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vLSPJ6GAqWYhDUrWtyi+bqH5oiZtMZFuH2JeGtDouAkqMafF8
	3wynLRY0WEj+CjZwVpuSaiT2B/6OeZI63hcHH/J/AP8h8QqHo7AJjGO4
X-Gm-Gg: AZFdTZeC2MUUxvvZR+QKXKHhpYDGkxNHRc25wrVdh4mEb6YBTdj4sbJdrv3nanrtEsF
	LlOS94+Qg/GsIVopAkZhfpWa6j4lZfk9M7U+EgKyAE+gfEvtBZQKreWnpDaFwI/g/60SDJxQYb0
	tJDXg4+Y31N84lDOr87FzCIHBxjiwrTW1oNaPx2LBpx3wESsKmVPQLhF4XfLLix044OZqlrxQXw
	0sMBlYzLNBUqIxrA+iXVk05dovYEB7swbPJeTmU/oi5yMjbl0khe5Hdce8/C6fPg1egcVRXptY9
	q6OiJWLUCpXPW7CggqP7Y+a3GuTuN49NDSZqwh2wxAFBs34HdvpffHTum/L2ex2bQDepOyH7L5L
	hS6Z1U0joMJBYjPB6RoVmhS07GA4vg2QGFdJby633YWRyZYpdyq4Q6g44SJqafDnYgCMmSMlfkx
	Ksf9RznnrNvCCvBV9OG3bCXK9QwMX685BnQVJyl8hsiFrE6z4CATAuo2/REpAPF9EH/For+Tx47
	+q7FqJyktuSJmwz/X/Xb01YFrd+14wmv4uuvXzm+2eGj05AhsAf1R8RbQhUCnoBemSFNOQv+qMc
	bzlEAj5xhsGFXLxIiaf3FFbhhvpT8iLuW8+yNYU3uggHBO8Yrb0XNJ2vgkCred+0lyGewsmynfQ
	=
X-Received: by 2002:a05:7301:1a14:b0:382:5dd0:3bb2 with SMTP id 5a478bee46e88-3827fe7882bmr4750485eec.9.1795092573428;
        Thu, 19 Nov 2026 04:49:33 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17909542eec.26.2026.11.19.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:49:32 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: sdio: check the RX packet length in mt76s_rx_run_queue()
Date: Thu, 19 Nov 2026 20:49:28 +0800
Message-Id: <20261119124928.1398520-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

mt76s_rx_run_queue() reads the packets that the chip announced in the
interrupt status into one buffer. It then takes the length of each
packet from the first word of the packet and does not compare it with
the bytes read. A larger length can make the driver read TX status
records past the end of the buffer and build an skb that extends past
it.

Stop at a packet that does not fit in the bytes read.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under ASan, which reports no such
read with this patch. Not tested on hardware, only compile-tested with
W=1 on next-20261116.

Fixes: dacf0acfe2ce ("mt76: sdio: extend sdio module to support CONNAC2")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index 3f314e8e1e69f92..86dd1165d2c7f1f 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -127,6 +127,8 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
 
 		/* parse rxd to get the actual packet length */
 		len = le32_get_bits(rxd[0], GENMASK(15, 0));
+		if (len > end - buf)
+			break;
 
 		/* Optimized path for TXS */
 		if (!dev->drv->rx_check || dev->drv->rx_check(dev, buf, len)) {

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

