Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813832;
	b=2v3vZ7H1ZrChvJ04POFCEkl06BjgVzPIV3Oske9Ps08+fYu96ROdEjJGjRpbiaL4XteR
	 lPDqCWfP6IPAvnF4xt76SJH/41zZULe7E/lhjO3MhVYchDTL17CIt27YTcV9ZKOnx6Vm0
	 Pom0Edc0wytSavyil0hvfujOicjuNWO8XWItL2YTbVLkoGiTgMEDb6vOB0Zyu724QyL10
	 aSUJZ40C61RR5lAzbR1o82AZfe7jL/xqdhj9N0ZATgcPOJCS2WBLR0fIA1eor9YyiG6lL
	 8U6dqOVUoINBwmad3qWSGFBlfVk73Z7JkO+iDHBQa3O26IroCRnuiSiqVkY2z9k8pSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813832;
	h=DMARC-Filter:DKIM-Signature:X-Lms-Return-Path:Content-Type:
	 Content-Transfer-Encoding:Date:X-Original-From:References:From:
	 Message-Id:Received:Cc:Subject:Mime-Version:In-Reply-To:To;
	bh=0pbJ9JqHguEP3ellQ8NSDLT0KF4X3cggIbw3V2HEQsc=;
	b=z5b1ULBwjMNc7A2xDYQE2w7K0tlNEPsZk6RxVFH5FgfkWNJUa66t+E9emLEg4CV2GBsm
	 LOdUegjetTEEl8+5VXOZ6J6KKRLpm7sQWTWtQ7G1oeMHga2f0WnLGcHAUGk4PI0pdR+EM
	 CbZX/FvLIDbCTSYz9NAQNET5DUa8JqKrxDrSuDb0uRIkaMZ+Vtk8w+jXlFkAZv6G7i2OJ
	 A4N59HmbDq6m7TuVbfborpthjdBbz4pwss8xMDix4jhFMMchnuAHKtvmmVoX8wiSNNgSQ
	 212PejjM8VYZaFB9BQbPf0tRJ5cDlSzeIHsqD2A3Wu+3RFvdpQPY+x10Mzd/n7IXG1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bedmex.com;
	spf=none smtp.mailfrom=bedmex.com;
	dkim=pass header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=yig++c8I;
	arc=none smtp.remote-ip=209.127.231.18
Received: from va-2-18.ptr.blmpb.com (va-2-18.ptr.blmpb.com [209.127.231.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D489E606A330
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D489E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=yig++c8I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1794813825;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=0pbJ9JqHguEP3ellQ8NSDLT0KF4X3cggIbw3V2HEQsc=;
 b=yig++c8IZCtCwwtK6IeL2ydkt4U3S7srUaBmwJyDOEsVj/wxDATS8UUwSR/GBRPUnzaBMA
 7RFiRifVjame0EX3xHtWUT83g0scpksnEqq/ZtnilcVQhu9jx6IXYyU2fHEDNEMXfoECIH
 TGypNYohQIi+xVIAikLkZtzfa55XhkUFAiGz4rl7jweMzT02/x1q6O5K4pdUZGp+uUAWLZ
 1N9qSrrHIIheNgVkDAL4FzbOqG+0hjjjFbFBKFWIEHEHplv8FmOKqVdhgDjXR92IeCOopB
 R7j/lPI9DJF9QeaFq6nBm+hn8K3W8QLF7hDFg9zv7CEluTDbHZqCY8BGdtmjxw==
X-Lms-Return-Path: <lba+26afaaf7f+a522ab+vger.kernel.org+yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Nov 2026 15:23:22 +0800
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
References: <179481380235.4.7388336477392853157@bedmex.com>
From: "Yanli Yang" <yanli.yang@bedmex.com>
Message-Id: <179481380235.4.9476425206200425967@bedmex.com>
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 15:23:42 +0800
Cc: "Johannes Berg" <johannes@sipsolutions.net>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Zhirun Liu" <zhirunliu@aicsemi.com>, 
	"Dijia Xu" <dijiaxu@aicsemi.com>, "Chunqiu Liu" <chunqiuliu@aicsemi.com>, 
	"Liheng Wei" <liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
Subject: [PATCH wireless-next v5 1/4] dt-bindings: net: wireless: Add AIC8800D80 SDIO Wi-Fi
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <179481380235.4.7388336477392853157@bedmex.com>
To: <linux-wireless@vger.kernel.org>

From: Zhirun Liu <zhirunliu@aicsemi.com>

Document the SDIO function used by AIC8800D80 and AIC8800D80N Wi-Fi
and register the aicsemi vendor prefix.

Describe the shared compatible, function number and optional host-wakeup
interrupt and device-wakeup GPIO. Chip selection uses the SDIO vendor
and device IDs. Power supplies and enable sequencing are described on
the MMC host through vmmc-supply and mmc-pwrseq.

Include an example for an SDIO function with both wake-up lines.

Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
---
 .../net/wireless/aicsemi,aic8800d80-fmac.yaml | 78 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/aicsemi,aic8800d80-fmac.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/aicsemi,aic8800d80-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/aicsemi,aic8800d80-fmac.yaml
new file mode 100644
index 000000000000..f9ad3cd6e07c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/aicsemi,aic8800d80-fmac.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/aicsemi,aic8800d80-fmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AICSemi AIC8800D80 and AIC8800D80N SDIO Wi-Fi
+
+maintainers:
+  - Zhirun Liu <zhirunliu@aicsemi.com>
+  - Dijia Xu <dijiaxu@aicsemi.com>
+  - Chunqiu Liu <chunqiuliu@aicsemi.com>
+
+description:
+  The AIC8800D80 and AIC8800D80N are Wi-Fi and Bluetooth combo chips.
+  Wi-Fi is attached over SDIO and the chip variant is identified through
+  the SDIO vendor and device IDs. Both chips use the aicsemi,aic8800d80-fmac
+  compatible and the same device tree properties defined here.
+  The node describes SDIO function 1 and its optional out-of-band wake-up
+  lines, and is a child of the MMC host controller node. The chip supply
+  and enable line are described on the MMC host controller through
+  vmmc-supply and mmc-pwrseq.
+
+allOf:
+  - $ref: ieee80211.yaml#
+
+properties:
+  compatible:
+    const: aicsemi,aic8800d80-fmac
+
+  reg:
+    description: SDIO function number of the Wi-Fi function
+    const: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt connected to the WIFI_WAKE_HOST pin of the chip, raised by
+      the chip when it has data for a sleeping host and used to wake up the
+      host from system suspend.
+
+  interrupt-names:
+    items:
+      - const: host-wakeup
+
+  device-wakeup-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the HOST_WAKE_WIFI pin of the chip, asserted while
+      the host needs the chip awake.
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  interrupt-names: [ interrupts ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mmc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wifi@1 {
+            compatible = "aicsemi,aic8800d80-fmac";
+            reg = <1>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "host-wakeup";
+            device-wakeup-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 539aa1c89ce7..e7c849197dd3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -76,6 +76,8 @@ patternProperties:
     description: Aeroflex Gaisler AB
   "^aesop,.*":
     description: AESOP Embedded Forum
+  "^aicsemi,.*":
+    description: AIC Semiconductor Co., Ltd.
   "^airoha,.*":
     description: Airoha
   "^al,.*":
