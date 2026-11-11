Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408276;
	b=Tg2jTojsXoxVDVZuHPvZdhdeKd6QPcnzHUv2mxcJoomq+EIjqzwQX6rySRAqvrWSuv+k
	 WQFbxQoGWwHQ0/TiziNToYcdMwfr1IcYUXW+RZMuWvfKiNB1k7hOX6b44qw+uGoCTN4zX
	 GyxVVSNTctvM1XRN9NDBfzI96Mhq+bp/KwBeC9tgUi/hMDQnl/rZqF8RZtlGVMq5CKwph
	 Fzoz6YDdn6El8cUvnvx8pwMpLlHvHuh9po1ULmY/wWiKp8b2CJUKXzH55kk2EQZIaDB+7
	 +p1I4L2XuPk7wWVYtqKtyw1LyVinS66P/OfWzHwd5AtDTQ5wHyEuBMPIo0AG2lGtLdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
	b=19DLktHUVG1XWBfI5dAoCUxQE0TI8f32HePuXOqg4pq9W9IysX06LpeRkQiJ9cc482CO
	 WBukJQ+PdShMpWougz+MiNXMHYXdBPFFgkWOG6xvlcHft7oWGCEAWttPe+W3NHloWqdop
	 TEh317d+dqxs7VA4j8q5jyf1ejOS6uyeiLkkTBObTU3IVQNKO9nAaNA3v2FoAQCGTC5Ew
	 dnvxGvW21InndKFOaQWg9DftrYpFqh88RmJ2AACKuxaJwDBEU+Zl7ycRc8vgkvIgsfoJp
	 jREHnTpNcLP7kRONiH6Kb/Sk0qleqCV+XRRsAUiHPwShovaofmEaQcz7gCA9eDTq62Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxcv0kJs;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BA4606A8AB
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 14:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BA4606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxcv0kJs
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso34605365e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 06:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408275; x=1795013075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
        b=lxcv0kJsZ98NSPjbORZDxEUJ3JH/hNaN0PzRtl1xrSfNWEJrPEKijUUDQY7ltCAScu
         mZv7r77zJ546S+1GlMEsngJNEUXQXf4GXRiw5Dst2XaLAF3uvfJarsL23Qsn77D/IIUW
         jWhwnJrudNp2c9xFcPdXUBsvePpyAUze/rjtOfs8ilbcGgV622BP4EwRqYfJX+OJeBF8
         i0z5MUCdW2cMxbrO+I6MJwmQ3mqN8BceFsGRSbKVYwNDLrUEdkrlrA8bBIibIAxliOG/
         kXJ9ZmLUtEMF9nfKmNXa0WrjruvpgF/gcrlKur9NyZ6URVGYDY8n3zCH32sksdN2n3di
         Emuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408275; x=1795013075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
        b=TyyHffzFBOd7KKl6GdZo/69PtLsWDbQemh9bwHgEwddrNVoHIz6/HuC8XD9o+TtQMO
         hRqM3n/MEhMNrpOS1ge6Ei1BxaR8ywxnnMwgl1ocjlsF7nfW3kMlNvWiIXikLnk2WmyR
         aDxrYYgURjdly9tOguLI67x1Tr+kf7oGDtZAlkVHCtuxE5qB3u5QVnk91FT2ZRnA3PSN
         V4XKUBJsStFwUTucdHwYSEZvuVoMdk8ycumAPjTsBCEDIP6wRsSQn0d3BjVBXyVVamrw
         LQCZ6xQ1RuImlw+8ApHfyBqUoJjcsnG2f0POKnKijAn4+C7RCJnmBpant/GpDFDm8Dla
         nECQ==
X-Forwarded-Encrypted: i=1; AL+hErEyjvPnNLDB/3ohkGdzxX0/Gsp3ro8y0ix83AgTtDxeW2PztaCnwdx4aGn0DQP+6rR2AF+4ypVZl/FkDVb45A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KRDFIFuyWnOFLaxsCpYnF3wGA+odPIWVwCps1X2uM5qTqK1e8
	w46ps8lUsvHugP8paeXpxH/vhPtJtS29FQYrwOKwkdvXE34opSYgYIR4
X-Gm-Gg: AYBFou2nLWk8Rv2jive3dJ/s70KSHs7zZC/iaCvRb+8cJ/ba33Duopu5zS2jIiFSdRQ
	lkXPLJwgFq4K3kf2KIidIGKUNlfN3d55K+U/4TP1lf3gl13k6gybcnF8sb2zHrbrVG6SNwrI2yt
	UYkPrP/fDzqUUX+6ZiM4In+t0fAPQG1/vQI0UnpcbhcR/0wOD+dK29PTH40ISO2eejvO2t3KsPV
	breWKkXVCwwYULo8L0docHVZSepnQ2txeS5660dDXTzwLnxdn/xAFuTfaHeTYyKwiXQlKSzqFCq
	SO2q5n6sKK78ZAapc1FNIEFbgya8nQ10akBowcy+q8I6HLWQdOv1oDrk6BX46WSf/jlxt+pdSVv
	PLXgMk6sDtWRiiWhXVt7T4JTUhdK/W2mv9xvoTGNEE/nsokb/FugSug84W8M2PDHHC6WMkMrHmg
	1ofrjYxshxJ6037+Y0bvOnK2EPDbP5/zJBw5LkBgxIUrqTXR4ib4i+gdLlIhaHRyE/TjVdHV732
	RaVJMaRqWpAgA29eWe21Ee+7PdA9uKfhNM0XdYBPjhJdFIHe/xeV6wbpKGUz7+u45JNb3xoldJp
	NHAZ6uRkxoEI3jkn+XY0V1oqGuQ8mfC1q9s=
X-Received: by 2002:a05:600c:19d0:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ba093aa687mr48679885e9.15.1794408274601;
        Wed, 11 Nov 2026 06:44:34 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:32 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 2/5] ARM: dts: zte: zx279128s: add the WLAN DMA interrupt
Date: Wed, 11 Nov 2026 15:44:23 +0100
Message-Id: <20261111144426.1321237-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

The switch's second DMA engine, the ring pair the vendor firmware uses
for offloaded WLAN flows, has its own interrupt line, GIC SPI 38.  Add
it to the ethernet node as the optional "wlan" interrupt.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/boot/dts/zte/zx279128s.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zte/zx279128s.dtsi b/arch/arm/boot/dts/zte/zx279128s.dtsi
index 8896a8b06725..9ddc5ee02687 100644
--- a/arch/arm/boot/dts/zte/zx279128s.dtsi
+++ b/arch/arm/boot/dts/zte/zx279128s.dtsi
@@ -201,7 +201,9 @@ pcie1: pcie@f100000 {
 		gmac: ethernet@92000000 {
 			compatible = "zte,zx279128s-gmac";
 			reg = <0x92000000 0x400000>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tm", "wlan";
 			status = "disabled";
 
 			ethernet-ports {
-- 
2.30.2

