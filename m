Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774450;
	b=tzIqyH/88oYzPMgV2T7h3FoIAXAZrVY6kFhDWz5qOmmRlTlApZhlqM2FENs0bNNRE8RH
	 /NxqmKVHqDyKO5NRPSta5v7RbLC9FLXq1xnHWGbabHuhgwFD62hWlvevb2CA6GyQbfV4d
	 8NjjZd42ANeIrk0UnoEj0Hrt/KY0UG2xiBKSUgH6abiIGEEurYJZlTkKZa3JP3/SP3UIr
	 wjTW974oCZ3cEzj36FNuUkAR2KVJd7jfd9HjRaN0EE5MGDgzrZ84MC6s03xNzvn0I19Rm
	 RIeG8o2iDxsk3esSd0Ct7z3ZuR++LXxbVCEIqPlRwHyj7pQeQRAsCevDbXFJkK5Dp4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774450;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=mFrz0tg1BYUUgnbknpOtDLj8CSqNemB5JAMMawMUfoY=;
	b=OjlJXX/OcAg/V+fdlTDjf0CCR2YL8Ffr0iOmVZXwZ0KAXkA5lTgqroEJYh//BTbZrM5E
	 NmhaRV2n5WWVg8hgjmiP+FJsWJXSfZLIdidREoXBTJdwuSt0+B8XCMqgU/OGGEnM629qS
	 zs1QQ+sCHKBrVtVKozOaaSnKV0knFy2s4xqKy7SWcDiphwdN3PpGvBMv8drR53+GOqLKU
	 AWR8VlrJzO4Uf9g7yJsUaWY2aw4oHq9wSyBSau32gNUz+k2qsGs5hUlJOFQicq1WG+u4w
	 py2pG4wKlH1yIMW+6ow1/nmuTJ5n5Gju14rBxgUWf3t56FShcz9hKIrvAcO3hDU7XcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=A7yFdWkx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8144D606A32F;
	Fri, 27 Nov 2026 10:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8144D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=A7yFdWkx
ARC-Seal: i=1; a=rsa-sha256; t=1795774388; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E+nIdGxY8F9qO9biYcEA826RxaXPV2rWPVie3DRz3VVwGbB2yxx/o/9DTuWS7GD4IGUjwA55yPXv8qBNnBaFSq1NuUnDU0IZ3lHbFHoDoL6YxjbzTmIcmNO3WcuLdAIyItcLa++moyTq4cbuTdkLDk+FSfJFbiGXnXmm0yZTt3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795774388; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mFrz0tg1BYUUgnbknpOtDLj8CSqNemB5JAMMawMUfoY=; 
	b=CP3JaINRUAv+LK3t2NpDLYJ4I7VLK5Hwgu4pQR32BCHOCbNDG/BxIx4/bK/vcSor/wG0mCBfKVCk8jROAX//2YD+L5fRtHWkndFSIAA7MC0N/y2i1/gwWV+JkYu3Wk4UB8h4pMK46CMiXekyEUQhNTRYwWydJfp5SvAakl2hQ8A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=A7yFdWkxY/6Y4cIbk1Q74sNWSsnwT855XWb9KkOw4cchutj0pC5gLeoTZyAVKodlT2uHJN2HkiHaEC3FEb4n4UKBH3UVKMIFtg01GKmSD47OhtsxacHklpmmyuSWldYWVqEkeusIMe8lbsBqyiW3VUJ7EcH2TDw87kxJVk/8+sWbCG78yvZn8ZYoVHHN9BVxOiJke0z0hfSHeNYfTraKc2XSQYhFMgs1rnQ0c5IgVGVAU++xUYOjCC3EAqq2mn7ZCoAPjsLh/h4PJb4ehNmk5bkiSRzhmYsnmOXE0PSvrH//IlPLn1y1hQxwEE5IKcSr5GaK79QMYU80uyZac9IXNw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=mFrz0tg1BYUUgnbknpOtDLj8CSqNemB5JAMMawMUfoY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795774385578453.0741621616363;
	Fri, 27 Nov 2026 02:13:05 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	Ahmet Zeren <niko3x@proton.me>,
	Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next 2/2] wifi: rtw89: pci: fix TX status and counters for NO_ACK frames
Date: Fri, 27 Nov 2026 15:12:59 +0500
Message-ID: <20261127101259.91-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <355183d7bab743e99e3d8bac03d80ed8@realtek.com>
References: <20261126083141.1470-1-owner@ph4ntom-rev.uz> <20261126083141.1470-3-owner@ph4ntom-rev.uz> <355183d7bab743e99e3d8bac03d80ed8@realtek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Fri, Nov 27, 2026 at 07:32:13AM +0000, Ping-Ke Shih wrote:
> > In rtw89_pci_tx_status(), IEEE80211_TX_STAT_NOACK_TRANSMITTED is set
> > unconditionally whenever IEEE80211_TX_CTL_NO_ACK is present, even when
> > the frame was dropped (RTW89_TX_MACID_DROP or RTW89_TX_LIFE_TIME)
> > without being transmitted.
>
> What is the problem?
>
> Set it only if successfully transmit?

Yes, set it only when the frame was actually sent. PCIe chips like
RTL8852AE don't enable tx_rpt, so injected NO_ACK frames report TX
status through rtw89_pci_tx_status() rather than rtw89_tx_rpt_tx_status().
Setting NOACK_TRANSMITTED on MACID_DROP or LIFE_TIME makes mac80211
count dropped frames as transmitted, and setting STAT_ACK on TX_DONE
reports NO_ACK frames as acked. On AX unicast NO_ACK with tx_cnt_lmt = 1,
the single TX attempt finishes with RTW89_TX_RETRY_LIMIT, so both
TX_DONE and TX_RETRY_LIMIT mean it went out on air.

[...]
> > Clear stale TX status bits and set IEEE80211_TX_STAT_NOACK_TRANSMITTED
> > exclusively when a NO_ACK frame completes with RTW89_TX_DONE or
> > RTW89_TX_RETRY_LIMIT, reserving IEEE80211_TX_STAT_ACK and
> > tx_ring->tx_acked for non-NO_ACK completions while still accounting
> > RTW89_TX_LIFE_TIME and RTW89_TX_MACID_DROP as failures.
>
> I think no need this.
>
> > Fixes: e3ec7017f6a2 ("rtw89: add Realtek 802.11ax driver")
> > Cc: stable@vger.kernel.org
>
> I don't think this a big deal. It looks like we have Fixes/Cc stable everywhere...
[...]
> Why should we clear these two bits?

Right, tx_ring->tx_acked and the other ring counters should stay as-is,
and clearing those two bits ahead is unnecessary. In v2 I'll leave the
tx_ring counters untouched, drop the flag clearing and Fixes/Cc: stable
tags, and keep the commit message short.

Thanks,
Enver
