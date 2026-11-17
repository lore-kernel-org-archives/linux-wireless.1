Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937328;
	b=SIxQsKRULJ2urNjR0/Sn7k4MzWGFZmjiuf0P3a1WYRnDtzWHTHHFwlx8XgSpzUd03rLm
	 2EwgmkqIUk05xMCUH4zGAm+H7YU/FTK9dPShnx3Vnziw46egTEky5kXkQEq6riskR2p4t
	 aB/QQKVMagmMMd9sMVfDODsyzWFfdyvv9wUIEeMj1Doe+q8IEgkJHtpaeqLIks3sV1gmf
	 DWbZVOB1K25LWmr724MzcxMmucZHQj3lJq/uZWC7Gxj3G29PXsi1qwDKyMhEt9hYtdj6i
	 WPPTiVIxbmGwqKeIk71Ow6dmcTSenQkWw/nOUCECEnLXSJ/j0UBIv4YuyAISNRxjOJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
	b=gjHvhX6zOpS1kl5ONuA0HP5+sip+RPA6dvY9NSgRRYNIQP1BQNFaTqbb8CqTAXbWr0dk
	 cUYTQMgTbmqW4xkGNybSMz4zgVyYRTDFjeFLtNScW5lQ4zrlB1U2kfBl9K+mn4pfDeUqd
	 07dKqxSzL/xhJj2aa/1/aa+qYStEGm6XZ/60Txh7nOQp5cZCEupAc0h8OxcnMvdHXbEal
	 Gd/w31oJID+0IFD7AdUOsi88roFxSTolrxidZrB89+QOvbQEFTP4KM2bfhxpHQJTQgVCN
	 Xo/WU+5LxIGwrserjZQjIt/aFpTxugRVh6jf4uDCqlUEiSrEqf4zzw7x+fFGlDkrx9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDwh4KfT;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D8606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D2D8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDwh4KfT
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso2307195e9.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937326; x=1795542126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=EDwh4KfThj9gvgd4ZiID54fBn43gGzte/ynCoDYEqJkB2FDrv4Gf/YpoLOTiiC15cD
         jtT3YQwl8mXytztDAUQUB0F3f5wsC/dGO96h8RGOCu9ocl3nTFJbLm3zC3EVCK9Bk1W+
         U+g6qQRqQ7ewtsQJLqe6lqKVT9qiGvEIP9ZNwZTttxt1Ag/XzfmG3wpCADEEHewCwlKQ
         3+AGbySErlBLCYMVTdnqo6Su9Hy9trzoBcpIgacMj7zNek9dyKZb/SHJpUGr1wlAAncp
         Tu4sDAz6ONg4yU8BDjCK7gjyAYTaXN7lT/790myHY6tXv0h1SRhHu5IUE5OVwoLk2Doy
         ycXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937326; x=1795542126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=ku+6xTcNnNhcpn/8HTlfir3wZuTiPbHO3d66YIH3JicYgkFdj5IS8lokNCDx2z4buY
         /VHMtC4YpHJOVe1ldBwMu+Pjqr2NY8qeAxrxvAiydiWIG8Ns5iAEfgXpetynvNrjPacn
         Pxlm4DQBW1OifDwYYN70sJw6VQ6M1UoTR9oTTxQ/FW7vxwcB5hl/hefcC06D4An87Kc6
         RzjM8j1+1pXd2qPLqeijuSA4y26QxYtWgtMq0b1C4a0WzMxRn7P3SfOdQ65UwG2e0N5L
         l7YGwqbXevYJHmoTCTsKoTNo3LRUL2Yx8Yr+DnjlSG3Xnrvo0aX+tHIhyjV4J98a7G8v
         KCVA==
X-Forwarded-Encrypted: i=1; AL+hErGQLfIwO5XhgYNzuvCR52VVzqOCjlxBwNsfCToFNtAc3hjxFrxCBANSWM/BihX2p/ye41or178clQi8scSuUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KMp91fFZrpeO6U/PjgHOc7xehLA/wq9bf3Hmzbkxg/uK7ysB+
	oC8H0CYKLG5vaipB9pVT1V7bQMrITZQ0RDKpUeld6IGFfen0aqSBZCGj
X-Gm-Gg: AYBFou11fGiQ3+3lCioNCicffbQPTe+FmaSI5T+SnOf1uGc/25QHz/gF1o0R4Tq4Bbb
	lwfanWmHqUL/THEScCgv6O14ULDA+Mx3OoC3/Lr/45twbVbZjH41K2pJmnIFkiGOTMnRPS+yEpV
	Lwo+r/v1nMjL7PZzUfko5D2Bt5/w5nmg2OfoIHVNK895g2JpLMxh7ELaQ3MYxkgUsZFmKlwm31a
	+prlHZLPu55C91ibMedaT4B5gS0OWRwYPjF5eT96vQx2ZAk3mr5DOsh7k42bfhVePFexGRS6ehR
	C1NO/6fJN66zEZMt5PNBajGZBehvjE1dLrVzIYZ3y0Hql1MsxjHxOS2QPrG2KjwMTXj+l/uw6g6
	XYgNfLJv/nCltC4W5zdVe0VIkx2zrOWcRsXPbkb1eAMDKB4bFWKmBJZDOIoYG0QLKxeQ9YX9PvX
	tNEnR50xrak9VYE9x3N/uBCs5iN5wHGfAT7nigSH2vS+AWVYOFQTQHIxUfRJPkOYNnY/+ddGBB2
	xF2LdXxsn28NNvTp94nsM7nzDxecxcvP4H5xzTehYIIS06Ui81fBuHLh8lNBdop1/PfQ3UClYaz
	4u2wEiZYze8ywcmvqisTLC2eV0dgB66xmjFyKd1Z6/8UXTeQSw+JZpCoS1lDfbH4+cxTIz0BhhC
	wMJ7X
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr207958615e9.8.1794937325497;
        Tue, 17 Nov 2026 09:42:05 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:04 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add ath12k calibration variant for Silex SX-PCEBE on Aquila AM69
Date: Tue, 17 Nov 2026 17:41:54 +0000
Message-ID: <20261117174154.549590-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The module
reports the same PCI and QMI IDs as other WCN7850 designs, and its board
data also comes in variants for different regulatory domains. The IDs
alone therefore cannot identify the right board data. Patch 2 describes
the Wi-Fi device and sets qcom,calibration-variant to select it.

The qcom,ath12k binding requires all nine WCN7850 supplies, which only
fits designs with the chip on the board and its PMU described in DT. On
modules like the SX-PCEBE, the PMU is on the module and powered from the
slot, so there are no supplies to describe. Patch 1 makes them optional.

Patch 1 is for ath-next, patch 2 for ti-k3-dts-next. Patch 2 also relies
on commit 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration
variant for WCN7850"), already in ath-next. There is no build dependency;
until both binding changes are merged, dtbs_check reports the missing
supplies and qcom,calibration-variant for the AM69 Wi-Fi node.

Based on ath/ath-next.

Vitor Soares (2):
  dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
  arm64: dts: ti: k3-am69-aquila: Add ath12k calibration variant

 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 15 +++++++++
 2 files changed, 39 insertions(+), 9 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0

