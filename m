Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110616;
	b=huGhsZrMwu2/InCCjH4QQ8yfw7vlvj60hVuDR/mL/QYR3KvxXVMjkfYGMkJjO6cuUoTP
	 JrCJ+JknfkLmrqjruGV4pWHn51PjAtVAU6229dHcelZ9VSGKDt3H2ahOv9olRj+v4mXe2
	 5fDDI/wia8ZSo5qRvJEZ9dCFMlZP/lM4hmtRzB0/yUlJOS7VXk3CGeR2g417G+4fEtt5J
	 ilLWcvzie7eA45lK99JRjmGxtEXleJFsGkeQLsTJSYfaucQqNsi0KwJJJO7fwt6bOCFwv
	 qo6zoW3R6BbH7jWofQSaxhXLI5+P6/8h+2MNyMs4KVOqB32KjpvDI5L4wzlNXfiPyMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
	b=jjJEmnb/OR7J8wbdssj3cGtdh/zuwcEG0vTDU51fUpkr72uBVm3dCZfA31I+JuFXVAML
	 fobrN3LHPxmnplMnwhHBJU8NzK5jZ1Try8005a8XoaoxbtHKTHOLgbmzDORtApUA675LD
	 4cXFx5EpfPf9rgXVGCrw1CTNqa2Nu6igJAD8OIfdfyJ3KKMpT3VyVr7aFz5EjS/6A2ZKx
	 u752HhVFmB2f525WM98OYfjwJ7k0BjUJu82TAkE4+bcd7f5ksw6tfYwdP/Yh5G2HHnd5s
	 U2MrFOuNMPIg2oAbrEiw29OOOS19t+vMtVVeknaNg3nSNLHkyhbRtPwtDfbYL/6VtBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HqIwrB7x;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B436C60A5BC3
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B436C60A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HqIwrB7x
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1265507f8f.2
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110614; x=1795715414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
        b=HqIwrB7x2+DpqqIgAt1fYw2X+S0cMj8zCUqo/TtX86KaS4qJ5mPzW9HLO8eqO2WDh4
         f+Khohjj9EDyDE4t1MOVwWqhBgN6AjH76sRgY4qojJCrR7L1gJ1A9Fdd2lpjkHyHD6lt
         5VNSXCEizYBZRgwGV32R+VJPHlhk9toLuBUl200ttN5SIS68yC4iCUGC0blpVJmbmYxL
         EKvoeT6aFBbexdCppiSSpaeeAcR++6QXZG3HB2r4kmmF95cLAX0hydKb9sIo3CnsQdCu
         vsuCknPexkSExhRu5B7HWAu4hRQ4egkHYCs+QC+l9Z2clQ4LZmhyI0afLUfzzFGEUIYF
         pdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110614; x=1795715414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=esT354LfgWAtzd0fzH7vF+hhVEnmCcI3/TAJZroHtbo=;
        b=i2XUbimefoddSRUILHbcuUyD9rGgaiWmRmPsxI3tvZQBjYcWwTM1wEqlHET2eMrwAc
         O126evtp2TvijNthpHVQDorFcpnh+IopevxNp2xuFZX4YVrXXQwU52AbgerfrMpR270N
         pbnR55qRNyQF6/OEVN2PXxaP/VCXWiR1TxkEfd5a2/b3AwjefnbY8PJnsKw8XDWisdZR
         aE4HikYlvQI/GNz3IetyQ/HMOKGuj/b7b8UsdSHngWBNdeNAvYOiQqeUk9q6mHOfbUUy
         6KRYSB4tjjfFqooVcwgDtfusRCjx46juwSVceTjFtVAvZWiKkv19Q27WlW+kJjq7dZJH
         /YGg==
X-Gm-Message-State: APuU4Z/XjfId4N24J5jFmNd7fMmqGEyzRnigjFsiJX6ouYGo1df6Ykpa
	xWuEGzwxphYzF6ztYAcHGowotwfe5aoTVA0YIgRhrwXaVCQpS0zIfi4JcvBgBuHwHM1AQM+p3fv
	5ELvk5Ro=
X-Gm-Gg: AZFdTZeKM+ktsP0kUGT6CDVSmnUxZsFDAsi8jwDmlsMoZhCl+Fx6mlX4N7yCTs8w0Bj
	7r8dKtcai2H0naSoLyVCupxi0ImUaVl/GyEYvxdPScXrN2YdYik3dyyQFLiooL2S28UayMchQ82
	btiCzX227Yud1KoA8dIp6CC+gy1FrrS7KayXqHsN8VCRoj6t+eU4dwfWPoksKixYUMRtzX4FhuE
	PJFpR3HLJl0D+7NXh0GPck16kHUUp26tdOc+yNsraoMU7OCZUraH7/95jR27H4bWO7Q1SAFkoEg
	BbHHa9G1ZzlyW2j64n6SsmA9094E0PueZRX84scR+cDV9e5Shw43MGa/grdJe+OVUEk78eJsuey
	AUByfvHRLSXjiiBJ9GyEfHFu6QAB4cY8GvMmRRnMQXkJJZv0zWThSBLo6l+wN6ppkAIVD8+qNST
	ixrgAN/PcpSyhKNx2RZKyBRpSQ6Ro7+V4UUS6rASulfm9Fvb1TMlze1PMnlxZKRhjrM4DLSp9Ck
	KUyuxtE8xu9ipQOUYl8EUgsrRC1jaWbn90ZOEoaTQMzKCHLSFq+e2vwxjJ2Vfkk6e93nCVLL2+4
	moeSriwr94btUleUgbXn8vG1wD1rVP7k39YzQUyhjwqwn0H3QqOiO96im1eeYhjJZzRlqboKTm4
	Shqoik8vfwzLUASaR8ZWQ4+gSkyh0cb5WbkgwyWNI2/gkYVdvOEfigShs+9kqhqVcHO4+2WGBi3
	FOfGs=
X-Received: by 2002:a05:6000:4a0b:b0:4a7:4efc:11d0 with SMTP id ffacd0b85a97d-4abaf740155mr279928f8f.12.1795110613914;
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm876032f8f.30.2026.11.19.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:13 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 07/10] dt-bindings: net: wireless: add XRadio XR819
Date: Thu, 19 Nov 2026 18:49:59 +0100
Message-ID: <20261119175002.458988-8-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

The XR819 exposes one SDIO function. Boards may provide a MAC address
and wire a GPIO interrupt instead of using the SDIO interrupt.

Prepared with OpenAI Codex.

Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 .../bindings/net/wireless/xradio,xr819.yaml   | 49 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml b/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
new file mode 100644
index 000000000000..4f6919b6bcbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/xradio,xr819.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: XRadio XR819 SDIO wireless controller
+
+maintainers:
+  - Arthur Heymans <arthur@aheymans.xyz>
+
+description:
+  The XR819 is a 2.4 GHz IEEE 802.11b/g/n controller connected to the host
+  through SDIO. Its out-of-band interrupt may be connected to a host GPIO.
+
+properties:
+  compatible:
+    const: xradio,xr819
+
+  reg:
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+  local-mac-address: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wifi@1 {
+            compatible = "xradio,xr819";
+            reg = <1>;
+            interrupt-parent = <&pio>;
+            interrupts = <10 IRQ_TYPE_EDGE_RISING>;
+            local-mac-address = [02 00 00 00 00 01];
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf311e6c4be..6e7b5f6beba4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7211,6 +7211,7 @@ F:	Documentation/process/cve.rst
 CW1200 WLAN driver
 S:	Orphan
 L:	linux-wireless@vger.kernel.org
+F:	Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml
 F:	drivers/net/wireless/st/
 F:	include/linux/platform_data/net-cw1200.h
 
-- 
2.56.0

