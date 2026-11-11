Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368665;
	b=qK+5DByVaCF9FlcOxX/6YL9x7v1en6cfsKkiQ/uugBtucoyUZcoSU0cKg5swESCle5Q6
	 SkDlYjO0UaKfWF0vGGntZJA1eUjopGXrProzk2Wjci1LM07/eBM81EEEw/aR5Qjq1xD+R
	 mWEqjGUX9oFBafuWRu0kWAg/86p+4U2cW48Wz21T5BbFkzooTN5lS23oTsHzyG4doaiBM
	 8xKmA2UGwwTntU4IXoe22NmABocJe15owpMb4KGjz0G1bQzfnlAChH7ghqUPUD1UMpCEi
	 77t8FbqejQAspeMsBuBs18KHWlLrQekWVa++j5bnVYT0jfTnejbWJdKIhBaAtiPMgmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
	b=LWllEs76fZqi/CJOGMAM6IEUNGt+DK/e2DYYvM7LrExHmet65PBk0ykw9VW/U38bfuaW
	 FRMJqfuXA8NmCQbffhuOd+m1JlRXLdpuEbzpoLzKCnqsft22TsF902xDJBOZS4yONKBQI
	 PZl613gozsFMSJJ6Q3Tqpfb/iPVE650F8//nKgJbW/Z061M7vEWbaZOF5hih+PqnkQRxN
	 pN9mRoCeRHfs7+aVl58+3svqO/Tx2a+0U6Ef2GndsB8Re1oZjDvUwMWMvypTh7eRp0Cpy
	 iTvHHuKTL5HbfIsVZ6fSzDDjJP3Hnqob/PCHOLiye1zKxGcWujU2QKHnw3viy1eWhow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lcjSgRpm;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55736606A324
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 03:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55736606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lcjSgRpm
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-702fd86d674so1364526eaf.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 19:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368663; x=1794973463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
        b=lcjSgRpmHuggSjhLdMHCnVvH/bPQWR68Mb5S3pirIshxAAOFAwuzdPIoiY5Q2wL+Vw
         Yhug/XMF8ZDHULfO0FYBg/LLd9IWrLa6mRdEdGUkB/SFbtHo4kvjkBzjgrByaod8g8tk
         Dx5FsYsmhLSdCykojfTNjD2NEFALj2A4moqJFlH9hwJ/6WFbv9VFd0TOO9MT8p57cfzE
         O5Ndz5TSFcodXjsbtvIKSfi2Hh6Ss6+zpqwtcXuEdbtuO2XK8iYaNGq4xMUPXnFZbJPG
         MdqRETmoGSnW2R+vTmyW44vjbrCQOyxFD31eS7RDt3UB4iy71huiaM4AlzOcZ/3kRJj2
         2Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368663; x=1794973463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
        b=AErek/FWEGNNj31EZdousy/eM9YP/kACKJKshOxRo7s9lk33FzsnkXiGTi/xJBY4nM
         BrHUVCgK59vmhqp4+cOa4apnQnRks+xjxfDYQ5x+XvuBOjWCKTWPCgOdMXvHJefDKhMj
         APlKWtbcn9X+mrI81Y1MVsqyzmT8iXOv7LZEm5vi4c6PAAsmj5i0pn9BFVFCU/pF4jh1
         kMXq/i8FQFoUjiFoKu5unHj7aHFb6kc56JsWvCw/qFHUiwk5MNJU2IVKNKpQXxgIM77E
         DsMrjzAnugdTLUJ8LGsAgEBjUuV3yVTlhFcbbuIuQl1Mt/niCbeBYr6IVa35sarwX/Uh
         AO+Q==
X-Gm-Message-State: APuU4Z/gMweui7YMpDBNaqHSgB/dr/yHTmALcjNc+yipEOOnalFP8CK+
	VDeXvFjAvDTyV26C6KTl/rpViC4VCYmINhZ9gPCLG/JHRTVX2MuQCTv8
X-Gm-Gg: AYBFou3vX3LQKjqDyddTPy9iQlVter/7PpgHXSPtRQ8x5jd8GsiHSw41pa5RaV2hCZD
	6ZUgmPtHzF6h5mUlJqy7Pg1lhaewzRW6WKLfAbza49zKAjl/p2RJJflHMRoTijvcHvYATmxfM9j
	HTEe326/Qm8luvbyocK3MbER/1yfz3meekGFPM2iukCSR26G6zVQPscoAoNWRL9787dWvCc/4yp
	j8EOHwVJEFoajSX9xIjbI/10xIlhGXeShaVkDw/OGaxikaD65vhq+hCg8yp86P24aiJMajA8SAI
	EXKJG44hmLTJh513b87b1fnGZ3bNi3o4aoLGsxufuOuyUqkpbKI/jd7sLTlM29THXtd9XnFR4MT
	FFvHQmAKZbCyTSlb2/hxiTXUT5CdH7iDwaeFKHwncXzxB0UzoEHx9jahy2oQyflcZL33wff0sUE
	Smrb3fCF+akGbDWHltBx7IkiS+0U58klA7XCz52px582vU1loyoxkEcJsZdK1FHnJqnU1pQPra7
	jAQL9dScyNmV2D53LQCz16uNLp2f8nbg22IjD3EhOyyBjkHu4QCc4FHkdcSVYAL3mvxKGRJEcEu
	M3uGhHFZxzTAGVWvUS47TubEPJh6y0uDtGKaXRJE2StYqm0BSK6u3JCsFYJTc+4F//kGRXqpu+z
	csu62HAQwJwqbgL71kP0S4FafvUipnig8w0yK/Qv//n24hOOTATvEV27dUORTzJkfJXXn2Hfbiz
	AMnw==
X-Received: by 2002:a05:6820:1ca4:b0:6f6:1e3a:6fc with SMTP id 006d021491bc7-7191795fda6mr882755eaf.79.1794368663202;
        Tue, 10 Nov 2026 19:44:23 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23031a4dsm2487525fac.14.2026.11.10.19.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:44:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
Date: Tue, 10 Nov 2026 19:44:18 -0800
Message-ID: <20261111034418.194610-1-rosenp@gmail.com>
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

ath10k PCI devices can be described as children of their PCI host
bridge, for example to supply the MAC address and calibration data
through nvmem cells. The only compatible for that was "qcom,ath10k",
but the generic PCI device schema requires a node under a PCI bus to
carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
validation.

Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
ath9k and ath11k PCI bindings already do.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 0cb065265df4..992926ce5c5e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -15,6 +15,15 @@ description:
 properties:
   compatible:
     enum:
+      - pci0777,11ac  # QCA988X (Ubiquiti branded)
+      - pci168c,003c  # QCA988X
+      - pci168c,003e  # QCA6174
+      - pci168c,0040  # QCA99X0
+      - pci168c,0041  # QCA6164
+      - pci168c,0042  # QCA9377
+      - pci168c,0046  # QCA9984
+      - pci168c,0050  # QCA9887
+      - pci168c,0056  # QCA9888
       - qcom,ath10k # SDIO-based devices
       - qcom,ipq4019-wifi
       - qcom,wcn3990-wifi # SNoC-based devices
-- 
2.56.0

