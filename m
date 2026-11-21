Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283644;
	b=T6g8f4Nv463uaEVZieozqNyRouB0t8MSq0neJiBglSM+N6SPz2FBUVhoPKgHwWyexEyp
	 ec3EPmu35DUyG5ZBxpPL2soWtz502hMsf8KBFET+l74CeSPH6AQzuFtYm8jHEzIcdgeWn
	 6xpv7i6BIJKndn7n8S6FID8nW2A4Sz9AgUV70EHw6jyczRXSr4Cimzvdu7cziR4gc88VB
	 O1eGzQNEmGKEpRYarofDoMYZPKlWT9PxvFPK6Zm0AW9w53ZvZwZz/V1SGICqWOb++BfEt
	 Sqd6ldAFQsqiwY52dZizwMU8u/GqFX3GSgaxv0SLJTmzCwJwhU4p0+50JUT4zZ784Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=;
	b=Z624je/SY0O9C+a8Kl9fuTfWhfz5sEENNomp1WqOEki3/W1zCP4faICEtg/TRjmVJcPQ
	 XcG1xDh+Tb5zLNr20ufgrGaIlGkwdC8et0Iwv1VwvLkZcNtC5S+rs+jy607C/rD4QewkW
	 5Nxz2hLYFsh2WRWMzvu+I28/HUzGhq9Z3zqoOo8thiPjDZTr+5K4Q0Gf9kZhUo2YwVwv2
	 diYEGZuMLQ3CHW2MsT4hndAIgC3JNRh0SsZtn0GRZ6oBobeBbe3vfEG+ZVeFUmYQalNq3
	 Q1Qa2dhpNhFavpK9DQeKBtc3PmkIHLlG0zQMjqxrOWPXBsU6VgikTqTlLZQqdkvCSSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=T0tyFv3o;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728ED606A330
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 17:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728ED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=T0tyFv3o
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c513a854320so341827166b.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283643; x=1795888443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=;
        b=T0tyFv3oA9/NMSI+VLBro5Y0SVpcIpKeQXaWihIv6bzBqnfY1RIzo55W1U63TI7war
         YQdGpxqWkNEtt1v1uu1rDqIgK0WPTnyg9LTHE17aa0MfeUEN6b6b4c2rW3AhVxX+z/Ph
         JCUE5+e148e1E5u5iJJNvcWxPrrhF06lcnuI90Qam2xOTuIPAWgzvt6oVrLLtl8HlLxR
         iFHeY2MMYJ9OHl6AXplEuQsK58l1vuKd2YgdXglUrEUazo7we1lhFaK7TCIdxy4mXUYL
         Q0VPYTr3fewBcR5TQgUSPVu43Y80xBQxbum/8pXV2+ycuy8WCD8h9+fkxxfplR2OPa/j
         RJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283643; x=1795888443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=;
        b=rIn33IQnn6xsrQeWFkjR7kpspuR7wEDmptiKzK/kg5LYOHmcFxIWNivThXX8IIEcBu
         q4z2wk2rpfw86YoQFDChh2BOp7lqJE2SBeZkwyO4aw5alxK2kCYEhgMJvpqK6082iFUP
         OT8v+NBZYAiJCv1P2f+ra9VzrIDOYeeGgh/2gxccrA4HcfY5DA+LqeKY8eFvlegMSiaV
         4zKaSocVrIJ52jdfOViICyX+5b2K0CPla5GhBtMR7LdNLOHGT27G8FEKWVsVQNy8ji3A
         edoJ/wNPmlod/SAt3QKvAjESpnVSwsQmUwJMheQFN6B0wb+fAuDm6qivQ1kiTkA/eB4B
         P0iw==
X-Forwarded-Encrypted: i=1; AL+hErHDDF62BU0JI149WjBtEm1CtLS+q4Hw1alKYTNHj9fhp9z204PV4QHWa1sg5tSo0twmInMKcvO/gE7h8WHYUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vsVhknbQPHxFJQRXQ9d2w0KfdpnmJoDKh1Rc/3kVt5gK+rLzT
	AVrCp3XgiSA0iylVGgvZzcq8VM7YH4lqZ6GM9Ag0QIzGht6UFehQuc7OavZU27Xt9g==
X-Gm-Gg: AZFdTZdUs7m4VbK4dR9u8GGOXX+k3FB3QLJfGPiWJRefJVWN3weg+X7iATNAFUGNv96
	qLqQXH9EMKOeymFgJ1t/nfSx84S7HUtTEeta71KghBPu5evuzODkZXzE/fVBAXM2juEz1DNRsyQ
	FVwUrIgkDO8UW6hi0cUt6D3bfkMZW/kKdzOq3wnmDpCv0Belp/B6DB67AbsPXZWO+IB/auA/hiW
	ZIU1ve/2oqElp7dqQ7VVg4zz2wnY8c+Z7V5C3rpBmy6TVQFKevzNLvTxgps77oW+Yz7OloSkbPz
	SqFsy0FImlZ0UFMLbT/N4W/vIgo4CcPj3BbQaCKkdLCQtFR9HCgcNuMBPlzdr7MkXOR+4YkxDU7
	QX/lgG7PyETI0MngeJ90mzILaJdec/nXIjZdIbXtLKlZ0Vknisxxgpc1BkS9ChW5jFIMMh23zpK
	YCKIZT6bZ9jCZ9Dm5iaTZ9OM8MZ4l5sC6i1kWbiJ2Y4H4CD1FZN4EMgFUk2Gk+EMrYbV/tKxeKr
	TICDm67juWP7OeVWBqAO9fn2VVPzBr3aX1lV/ck7fjZfCFOAMTOdkHETURZS/sIKujmLfLkUQYb
	cHWS3fUP6jlvsfNycEJ9TytGlzBK83Ers4fUUv85W7gvcpfNEJ5dAw9hdpYvHVuT5Vfp8h52lJ3
	WLkqeLOVGVeERi+dFQFrV5UO1jX2QvT3M10zpeUs7irmmud1SlmYl2X+FZRDyxP3AyWL3H9PlUv
	Y21qS1ofvdj45MUjBxgFuVQw9TWSm53Rk4XlB+TWO7Tg1ff+orytmCBJycbBnS/ZcObObTRXHZs
	NHdmdVPGElsA8y5nvOJYfP3O/n7Ojx2nBKNPzvDC/jLrKekZsOOd51As/boGBDiYDGLRx/gSh/D
	sB0kXNLLrzUCSvQZDJAPfVHA8OHLyr7qw9RBNTTiHrPF1K+PMglGZ2U=
X-Received: by 2002:a17:907:bb48:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c513a9af930mr531868566b.30.1795283643039;
        Sat, 21 Nov 2026 09:54:03 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm220167466b.45.2026.11.21.09.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:02 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt mode when probe fails
Date: Sat, 21 Nov 2026 18:54:01 +0100
Message-ID: <20261121175402.644803-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121175402.644803-1-julius@bairaktaris.de>
References: <20261121175402.644803-1-julius@bairaktaris.de>
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

Since commit 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB
device probe") the err_deinit_irq label of ath10k_pci_probe() only calls
ath10k_pci_release_resource(), so a probe that fails after
ath10k_pci_init_irq() leaves MSI enabled on the device, or the legacy
interrupt enabled in the target. With MSI, the device's MSI data is
released at the end of the failed probe while its vectors are still
allocated, which warns in msi_device_data_release(), and the next probe
of the device hits the WARN_ON_ONCE(dev->msi_enabled) in
__pci_enable_msi_range() and falls back to legacy interrupts.

Call ath10k_pci_deinit_irq() again before releasing the resources, as
ath10k_pci_remove() does.

Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device probe")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2:
- New: the probe error path left MSI enabled (found while testing 2/2).

 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..4843a41ea801 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3716,6 +3716,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	ath10k_pci_free_irq(ar);
 
 err_deinit_irq:
+	ath10k_pci_deinit_irq(ar);
 	ath10k_pci_release_resource(ar);
 
 err_sleep:
-- 
2.53.0

