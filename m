Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937329;
	b=W5pY/9HthCBzULYkKeLE+M2iDlJ5K9p3ZBdbf/+0APtTem4GlBq5NINRGpNCkfvlqN59
	 A6CRLE870WCIG3Y0FJZYRKnJrIKgSt2ZLMhQyKcvYOXi7k9u5ZN2O/mNCKRyoqRXXZBzJ
	 iCw+Tceq44BvwLcUh5Qs0QTGCp31Ccw3tws9PzM1MJ3D2/0PocqEF3jeZ+K+4xsnllHCY
	 I+YrfEleh9E9mtLrAwXkgmknxDCAgNHg1d4PO2bAOZzLcho/1p4titIZmUOhjlW4MztuU
	 t/JwNUDLZ9U6caxKqx/J8R3KthlDbnwRQ1kgxw23xk1bQdjAIvbR27RXNhlt4IBdZ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
	b=Dd/eiaxxTYEu3GpZ6O3wDHUOYbI5nwscMm5CaY5DnA0MHUGh5OWCiaTuyuMCtF3JiAPu
	 AQKKb28ulSLS/K9JS6Ff93IsVcBOuTd3F5G60wTm6zW2pKKXN/yDiv0bZhhzyvkhcDxhv
	 UE0pYTl35yEa2RC3RGsSoNeubqi+BcKGOwBRWv0chDihyaxFEOWfA85jVocWBtBqJlC86
	 e1YkyGHDMCEK+dzFDy2h8BzyjSh4n8B8p7W++w9V5i2+Uo71tOL5HTbdlZ9CY9MwvyXym
	 m6i1C8MEZ9UuSJtQL3u0xaQp7rDm1ejOpPiDqVIFiUUWtWoQGMzsGjFBhbSOrY3en1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFGjpIaO;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92EA606A884
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92EA606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFGjpIaO
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e47347279so20945f8f.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937327; x=1795542127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
        b=FFGjpIaO7cL15zX3nPk1NbIb0TtthT2MxbC6mTMT+9988qugXo4KEd/YFISIExRb2E
         vpqav2wDB9C+GbNYUWjPdXvjQ6TpIyso8ViGM199yvmnHNdu1Oc4EcskTxrrSCWf7RP7
         k1pVissPAZZg8IWCXZMGmuQA2OGVMNHixFndfiVAUbNuVmevLRN1e1ocOaL0qqJLfxKC
         N3ZLNnX/B2eniMkl/0NfPpm7ppln03kxUXKcYdHEORsSdKRexnd7oYZe4MgLysYp5Bvn
         Gc4osTTWZiGGCkQIgD3v17KPr35iNs//xj5GOcbbA2q/A6Wgx6oyMOHWZRsB3CKGkm2e
         F2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937327; x=1795542127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eS8A6I+JbYZ0P//SqMb5gbJ5IMT5Lxzbqv3mJYgvIAw=;
        b=cMzsHa4JyEyZK+Pk68vYY/QmY25Odm/v5w04zpQI6ZZ4ArB7MbePYj1GvC0DHiwhmP
         6vJL8tc3I/flooc2ck2bOphIfCqTb3TndCDIqN6ckaltKbmHoTbTzMkoIQDHJLVF+qMc
         Sz97crmfSDh6FX4yZzrXmrYEkXScTXF7r2mSTYB4xEA0WIW/9aBxF2R0CJdwrAXcPJAx
         ZfdIEb4vvmriCfi+xc4VBTdK7/ejpget4DSXDGMLmvtOu+40rFqRfXHt2Rujk8FKSsS8
         tvCa7netWIT6dz46gumjK2ZS72j43Fj+ldderKZ01FvKlDVYHd4tzGo3uuL0Nz5RyZPp
         sdow==
X-Forwarded-Encrypted: i=1; AL+hErGYWgETE0Cd357c5+OCD1iZwMJyDGr09tjst+xjWdzwyTXfDKwmgOosfKXDSIHcz2vqa0gWMSNaMcN9OMaIFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FPvV/x2+fNHuD4/U6zcjJlxE6l0F/qGitM+wgjkukpkY6kqqn
	zch60ZzC5y1GcrzeBjWPbOmYwMAsLkMLLVvgTquDOpptiX+X8lP1kLQq
X-Gm-Gg: AZFdTZe5HAAF2oCCeOv0AeohWwoc559nMFlQd8oxuIWMFCvwbyCVABy3sgw7DgddurU
	FJMSoapdxL9GeFwffrdXGUvy1myVuljpnKxD7ciydf3VwlccxYmlZpChJLjEL09Csc2hVl17bVv
	yHA7tHvjKOI0+++E6WQyko+0yFZ93p2YNZGDT1cGSlDdfCXd3dnk4SvYbUHTmEQgvZ10PLBVLKg
	0wNeiV2xqHlcdPVtOU+U8sGD8T7KJ2oISR9Z1hBBiucc6hCuSliLhE9ZQ0h1eMgWts3olbQruWC
	rEi+0uM1zscuYJm3t8HYFWcYtWFK+kL7xNe38GkogNtjJ/Q4H2wCkjG+q+fdUdci4Trf/tGHIXG
	UfzVkwNhIrzhFsSPQpVeSPufvVBMj2JcGOh9aOjRkiocOWCDfAg83+dmV4MEKOzUTiVu/H017Kz
	N3FwKcCdOU8B9cVxD163PyooenRxTHmxkimDiGMY35mCnwAGEHDatcYBBX/X3tcgeigszRyZ5wD
	uaiGEyLN54u4PHg+kqgInj8WW2XjdXolylVJ9Q/bUtbK6+HHC1jQ7Rzkyf+iLRvcovPxqyfJMVV
	Q4GMz02vaOvWecbfGetyrX8aTF0jSK3AHLipwyEPzXtrND5HPXHOBV2+Nw==
X-Received: by 2002:a5d:64ed:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4a638ae26abmr362462f8f.12.1794937327122;
        Tue, 17 Nov 2026 09:42:07 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:06 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
Date: Tue, 17 Nov 2026 17:41:55 +0000
Message-ID: <20261117174154.549590-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117174154.549590-4-ivitro@gmail.com>
References: <20261117174154.549590-4-ivitro@gmail.com>
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

From: Vitor Soares <vitor.soares@toradex.com>

The binding requires all nine WCN7850 power inputs. This matches designs
where the chip is placed on the board and its rails come from the
WCN7850 PMU described in DT.

WCN7850 is also used in modules, such as the Silex SX-PCEBE, where the
PMU and its rails are on the module and powered from the slot. None of
these supplies are connected to the host, so there is nothing to
describe. The DT node is still needed to set qcom,calibration-variant.

When the binding was introduced, it was agreed that the supplies can
be made optional for cases such as M.2 boards once the need arises [1].

Make the supplies optional. Keep requiring all of them once any is
present, so designs using the PMU are validated as before.

Link: https://lore.kernel.org/all/87ikyenx5c.fsf@kernel.org/ [1]
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index cf3e1fd99c12..27f443bbc401 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -63,15 +63,30 @@ properties:
 required:
   - compatible
   - reg
-  - vddaon-supply
-  - vddwlcx-supply
-  - vddwlmx-supply
-  - vddrfacmn-supply
-  - vddrfa0p8-supply
-  - vddrfa1p2-supply
-  - vddrfa1p8-supply
-  - vddpcie0p9-supply
-  - vddpcie1p8-supply
+
+allOf:
+  - if:
+      anyOf:
+        - required: [vddaon-supply]
+        - required: [vddwlcx-supply]
+        - required: [vddwlmx-supply]
+        - required: [vddrfacmn-supply]
+        - required: [vddrfa0p8-supply]
+        - required: [vddrfa1p2-supply]
+        - required: [vddrfa1p8-supply]
+        - required: [vddpcie0p9-supply]
+        - required: [vddpcie1p8-supply]
+    then:
+      required:
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfacmn-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
 
 additionalProperties: false
 
-- 
2.53.0

