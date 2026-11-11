Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408274;
	b=Tzi9hwaakebxaWlrdt0oC6e1LVbszqmj25O6b0IRKnj6HzCbXJIthoyCi6I6XuKqJca6
	 k6W7SykQBc1ZDdZ9We6o3MiQc1h4YMSl6/ZAleF4plbGuKc2qZ3BwccisJHMPBfB8xzrj
	 zV/Vh9XgG3tvreB+uZoDbkWZX1pdYnVpxlT5S5EcGkYX+XNoU/XephoWxw261khkbzyhF
	 6CoT7yflzBot9lo9n0bkNG6RnXtJLzZO9+bp6HxuE2Hn5AdV1DTWomsWR9/oMIm81gPwy
	 tWW1ZrXlb+JprDBrk6dHA8HMgkxomgxczLEcOY0ldkUP2nPqXlrzyEHbW93UMyPmjXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
	b=d0lDfvPw2Ix/eN5n39XIHsHy+hHMKDkLNOWBMC8aFJNoaYBdENDItO6tEaouVybZ0FoT
	 OjZ98sb8yH82e5lYdU9S07vANwUdjni/C4zRqrk+0MApexaNUddCJRxNQ9+qcpzcCO8v0
	 s9PYqsmSC1nqT7NzpNGPohmBCZ9TkkBhFN8SM/hCKMb4g+PjXnv4pQRh9tnjGuLdYqlHs
	 Q4lIx28zS5UtdB/KlBbnykYQq6LGINOVIhX+ZfYzJ0RpBAfOppGeDGSc9fXM+v772OjtQ
	 kVA6DVWnC8cJua6FpVG0Ehd+Rep7q1obglXvmHhigs3lTmNh18J4j+zESL36cytsmfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1yyVtKW;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4E606A889
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 14:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F4E606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1yyVtKW
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so36487065e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408271; x=1795013071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
        b=B1yyVtKWJ5NV0CiF7ka9DSnfzre11MMuYuCtwZYQBcDWhpEP6f6UJ5spZq4Uy7MbM/
         oNtKHy0AyOdn9Ls8Oiu0sAIPTNYdKg5PRn5ldTW8M7Pn2bVwSvJ7uZgA5CeMerwaG08B
         gIJPqaXCCHRQ4Ld4niiB3+hypf2g6fzwMo4zbaJ2i/BGvbq/kxG98hQKQFoHv/+jwyxK
         kVslqCzOunlj5KMoI/v2QP4pkzWnGAmdgCO1yCtkITGNyNXn+gd/m+kfI3ddpBTid+JH
         JJ6+tI7PG3+CbNT+tqrv0Bk0m018299UuszXB99OJhoaTCSk6FHRS9Kd1F7jycJEafcA
         nJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408271; x=1795013071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
        b=Zhi+Nkv3rvusH6uW5w4KPljf60QzfQ2nAoVqKLQy06u8HyHi3XSEWPGrK0vmZ8uTzD
         K29Vl9L5bsqMy/+WCKhEdP/obzmeCZrX7x6xMbXnFQXQt/x21x9h9xU81j0RH80JeyQi
         DsMZEvF503lzQ4rR7gTfVA2dMFBqoTyxtEdCbyq3ZeJKcUSarXeVFOgqOP5ebKzVtWwI
         JshDN10TsXSiO2VIu8SzvUvX6308xUKI0WfjAGGizsP2X/bCnYCC3XAe2p+6oHUaEOO3
         4ktFsv2D3BRG6Kcbl3TudpcS1fqQjpjDTrQPLgbjnh/+8oNI3Dafa3i2epPlQexSprQg
         xEWg==
X-Forwarded-Encrypted: i=1; AL+hErGCiEK9PSk4Ri5zlSLpqaA0rB36vYbQVgRU9yT0v9fvdJRfT/3HCJFUjHB6kZecTHZOUfHdsi2QN5Vr37bzyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z89pzfPGZKvf642/GdiRkzAgKrNqu2mI/I13M5392p+Dz1nSmS4
	Vr7+fnaRXw5wsuIdBawDU0VokMY8MRuW8oB3dUjGhezz3AwEC99pm339
X-Gm-Gg: AYBFou3MHq+hu5/6ulAPGAEQueaf4rZ7mCHy6bEVVN5g3vHN/KGwo954fV8xTpcAQFP
	Pz6+n/3HU9mHLSpg8lJxzCbpZl2K5FEpXfvp06yFi7cpR82whfGK9drRsp+GafLezko6e2qi9uE
	oFHY9bSgHNr174+FBgDFzF/kc60bth3bY0ZFas+QDfdHWPUTQ41r/LPyCOxpB+1IO0K3B7sRuBr
	oJo2F9HN98aSXa7ls8koiMLIW1f/79ieduFVjQ2juIWxXp78zEYT6WvsUT7E578rfjqZcLNBhJf
	142VpM1r28ESmlPH4QFJo4Aq/yGKtxwno4eUR1pcC6lOI7ieDQDD76fMAa7IKAVjTnEp/ic1HsF
	x6y8MsCRGM1d1Tm2p6Nq1y6liR2uA2J77tFHLeSSuKX6Ordt+mY3NDIfslldoBJ6UahAhEJc3Jm
	qjBMrzGUx5oueViD3GugrAp1WKxosSxGQAjr/XrTZaenIEHV60sBqlAq1T6bE5if4SjnpjerDVU
	zW/nI2f024/IvCuF3ulyvL1c23hiRL5X4IemzsWL9LNXShZrVlE8gExMF9p1+VkIh4tX8i2k1tH
	3tHSbbGk/pZyYdbFq24KxK9gHKWvMch6jzRnwsmETJfOwCUtTjAtfiyf
X-Received: by 2002:a05:600c:4e0e:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4ba093ac8f6mr46752285e9.32.1794408271122;
        Wed, 11 Nov 2026 06:44:31 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:30 -0800 (PST)
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
Subject: [RFC PATCH net-next 1/5] dt-bindings: net: zte,zx279128s-gmac: add the WLAN DMA interrupt
Date: Wed, 11 Nov 2026 15:44:22 +0100
Message-Id: <20261111144426.1321237-2-isasmendi.agus@gmail.com>
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

Besides the traffic manager's interrupt the switch has a second DMA
engine with its own interrupt line, the ring pair the vendor firmware
uses to exchange frames of offloaded flows with the WLAN drivers.
Describe it as an optional second interrupt, named "wlan".

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
index fcbdbafa766d..b9a419e5d44a 100644
--- a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -23,9 +23,19 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
-    description: The traffic manager's interrupt, which signals frames
-      received for the CPU.
+    minItems: 1
+    items:
+      - description: The traffic manager's interrupt, which signals frames
+          received for the CPU.
+      - description: The WLAN DMA ring's interrupt, through which the
+          switch exchanges frames of offloaded flows with the WLAN
+          interfaces.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: tm
+      - const: wlan
 
   ethernet-ports:
     type: object
@@ -98,7 +108,9 @@ examples:
     ethernet@92000000 {
         compatible = "zte,zx279128s-gmac";
         reg = <0x92000000 0x400000>;
-        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tm", "wlan";
 
         ethernet-ports {
             #address-cells = <1>;
-- 
2.30.2

