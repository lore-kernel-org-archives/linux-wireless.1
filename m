Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795681951;
	b=RzFYuiO46x9tkTi6DBA5YqdEsUfG8vxUQ4AnvrRFbrMW1X4iMzoAfnVeKMQXq06zQnPo
	 Npmcupqsc8JwpXa9vaK0LItkEoEZbwDMu5TQhXgCCB1/2JZQSITywD93+6fGf6IfWAhkW
	 GUxX6hyt4PycSCeSszeWWj0uUYd6gGxrJ+igAnbF1hzyh4VdQ3raIhN2vfw2gjeRkWm2E
	 k3wemIFSAV19ht6C/YHDbZrIuJj4bB5WUBaJ52qoyMYe/hBdg+umr6Wx+q7eGElCxNiG8
	 iGpLST1RMQfavP8RPg7g036xGAatsPJJmdxMxCTVkqriHrnNnu6vDTm6MRqqsf7AUpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681951;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=TaON/7ceRuHwzhJ+NepJEX25n+5RZ9JBg0bJv2TdRiA=;
	b=GeMbwqvCZNbPNP/lkzXI79We1Bw7dG7AhzXeC6va5BgLSgQHjWHHrrjBweksTpaMuoLs
	 o412NdvGgXmGlExfckM1gtWNhVl77JtzMwcwx9XgZ6ekDsYRRjvamZhbAhGLxJz78kB+q
	 ASdQfNwq5MIHfNVaGDqZlXIfQlA6UVHkui+bOX2kVt4EmNruTcTVp1rLNcFc0PP8O8iqy
	 vfbdde0O0SHyAcZjoMnvnXxhOm9rBvAvVgSHaUOp9B5UENQ5ofKuNkvrJYeCTcWnhSpu2
	 dRwnpNsGhoV8C41KxlgFPHg6K031SV18UruHwKZVGxlqpJAw07UFT5QjRie3PyScD5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=w6j9Y+ZS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B06606A323;
	Thu, 26 Nov 2026 08:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B06606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=w6j9Y+ZS
ARC-Seal: i=1; a=rsa-sha256; t=1795681934; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O1GA5YnG5DPJLCKeGk/wemwjdyJ0tN/9VIODMWDPsjtEYWS4A8NDdPOUbPFgtd73mgFJaUB/wNoP9M4JeFZ+LONN/NLBWDW2uweAM+gOgedR9QiWrllxuEaMMZ1lmG32sy2bdgiIkpBqKKr1A4fHy3U0m9V4Qca2v5gNoIKSKAs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795681934; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TaON/7ceRuHwzhJ+NepJEX25n+5RZ9JBg0bJv2TdRiA=; 
	b=eT1KwFih2eZ/1Kdp5sm6uv94ZQTVYR3gGNDPsRwtW5jFfXRbDsTnmP1QuIB2FVmr+LNqWlQF2v9SoyXfYOUWmrV6bOMjNBT2C7C8qGbsiOrCbSFVut+iYYcg0hHSZRjPM5GanDEoWrvYFJ7nKYyUL8iJI0TV/0Y/VgFv1q+wK20=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=w6j9Y+ZS5ysfu9gPZSOHN9dU/7SmXwubmo03hhmdUh138Cho2NyRqYQU+uE372JdsJHEZclkjVbQxLZfDKn2DT1P7p1XA1RGweu6LZj5QHANlNyKOfXTn+UkhhJx7qXw+ixJ5xzMdRLb+XxM5rA7/TpfDhxtT1VsahMwb+w4rt5VjiBrbtBNtRg9TwfyQuynMc4M7kTxuvTR+uV9ixP80S4QEWyMSqqgIzUthoaFct0JDvFYVJg+Vyl2i2zPgu+yHKQSFycmRRxcC51yAOtNNMgz7uuUlAtS3YvRljjewRlgzGFgKOVzGomKz6BuXrXMHFQGGn9byAt2iErITnHSvQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=TaON/7ceRuHwzhJ+NepJEX25n+5RZ9JBg0bJv2TdRiA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795681932571455.8790720297171;
	Thu, 26 Nov 2026 00:32:12 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next 0/2] wifi: rtw89: fix injected retry limit and NO_ACK TX status
Date: Thu, 26 Nov 2026 13:31:39 +0500
Message-ID: <20261126083141.1470-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
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
X-ZohoMailClient: External

This two-patch series fixes three follow-up issues in commit
92608bb5f14f ("wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for
injected frames") reported by Luka Gejak and Ahmet Zeren during the
rtw88 injection review, along with the matching pre-existing NO_ACK TX
status issue on the PCIe completion path.

Patch 1 gates the per-packet retry override in
rtw89_core_tx_update_injection() on IEEE80211_TX_CTRL_RATE_INJECT, caps
hw->max_rate_tries at IEEE80211_MAX_TX_RETRY (31) so the 5-bit
ieee80211_tx_rate::count field does not wrap around, and makes
IEEE80211_TX_STAT_NOACK_TRANSMITTED and IEEE80211_TX_STAT_ACK mutually
exclusive in rtw89_tx_rpt_tx_status() while accounting for Wi-Fi 6 AX
unicast NO_ACK completions (RTW89_TX_RETRY_LIMIT with tx_cnt_lmt = 1)
and excluding dropped frames (RTW89_TX_MACID_DROP / RTW89_TX_LIFE_TIME).

Patch 2 applies the same NO_ACK TX status and ring counter handling to
rtw89_pci_tx_status() in pci.c, which handles TX completions on PCIe
devices.

Tested on RTL8852AE (10ec:8852, firmware 0.13.36.2) at 5 GHz using
raw radiotap injection, tracefs kprobes, and hardware RPP completion
telemetry across supported/unsupported radiotap rates, retry counts
0..32, and broadcast, QoS No-Ack, and unicast NO_ACK frames.

Enver Ikromov (2):
  wifi: rtw89: fix retry limit and NO_ACK status for injected frames
  wifi: rtw89: pci: fix TX status and counters for NO_ACK frames

 drivers/net/wireless/realtek/rtw89/core.c |  5 +++--
 drivers/net/wireless/realtek/rtw89/core.h |  1 -
 drivers/net/wireless/realtek/rtw89/mac.h  | 13 ++++++++-----
 drivers/net/wireless/realtek/rtw89/pci.c  |  7 +++++--
 4 files changed, 16 insertions(+), 10 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.53.0

