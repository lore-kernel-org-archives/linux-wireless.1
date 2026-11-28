Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.28.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795861927;
	b=BfjcPDGeaN1WXyWT/gUs29gXoLkG8euzkq9c4xChuij8fmb9SHRdrhSmbQHqwXPS0Olc
	 hO3VJKNXA5hupkyZjgR+DttRzOQTiHgxiONKX5PK3nsXty9Bslf+IOj1IorlGXrkjhXi6
	 eABcJC86S1eFxtz+ftyatlXuo9jnDcW3fBwwJ6g9i2QAZB+CfW/68OumEaYJNhbN2ECuE
	 n0xdHdQtGQ2uJk+iBfoQBlqhzVIMwv/473EQ/MyyU/T7auRb6lTyrFxqvA9Aem7AQSyKS
	 m/k444n2qpkPc/N6OI7c/5N6mpVVJ2T/fJUNlCrYodbf2KcCEstoZMHrBYnLXkJiFbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795861927;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:User-Agent:Content-Type:MIME-Version:
	 Content-Disposition:X-Virus-Scanned;
	bh=nFXX5mNRFkmb5k9RBpmMdByunIg+0A7DAISfvNo8x9s=;
	b=LpZRsxSCdxncyX7GVCYTqmBVThdxZXOS75eaKtiWy8GjM3meQQ2Sl48lEQIO0FoeiMYp
	 NtNI2s6oLPXHTigTMNCDMnsLpm+x0ybZwMSQ7WYTLiWyEU8qu4scc9nSycio+ttsqnHBv
	 3K0ikdB4O4Fn5BE8z8uZcdGi98l50IJuHXOoJWmnrSyu3SRZxOk2jX1HobA2GDOpPc1ad
	 +9aqeyNq533nIjEL8wKYeaTArL2PGd2QzfMlweL6tsP6qsJIRTkUTQ79D0IyCmKwcFVbV
	 EQ9jW9zLujdbdIksHx0hfwxwDSG/LQbPQNIxgUr8Zw8BQ1oAGiXU61tvSc5C5Q1eQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rfdeck.de;
	spf=pass smtp.mailfrom=rfdeck.de;
	dkim=pass header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=C67inh28;
	arc=none smtp.remote-ip=188.40.28.6
Received: from www226.your-server.de (www226.your-server.de [188.40.28.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B06606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 10:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rfdeck.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rfdeck.de header.i=@rfdeck.de header.a=rsa-sha256 header.s=default2609 header.b=C67inh28
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rfdeck.de;
	s=default2609; h=MIME-Version:Content-Type:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References;
	bh=nFXX5mNRFkmb5k9RBpmMdByunIg+0A7DAISfvNo8x9s=; b=C67inh288EuOyjlHLTbd16tnrw
	LEfNVKocz91cWEjL58x8OGcBRclAyvMt7rE5ABo2qCfTAbOpFKD3sBfynLqTao1gtU5yFr6PZjP4E
	Z6pKCl/bwRUlHzZTAiz0gF+P2CXGQGvp2/2tKme7HrOc9RMk0EQ+mTf1Vu+r1AIbcWjFM8HVJ/qqj
	4sk8MjYybt4PITHredoloTmGkZLz8JPAwKY9Mz/IqByoFKdWB1kjiW68EAsxkKLEYLw8m1IsQkmrv
	MZjYa16HBID07uMkyCE54VjpcxyWfanyxsJ5KPcA2lmjo5i9RBT1C/YTAtzZfVU1da0uYiWfR0xZp
	nMYRlleg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www226.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <martin@rfdeck.de>)
	id 1xXFip-0006Ak-1g;
	Sat, 28 Nov 2026 11:31:59 +0100
Received: from [192.168.0.32] (helo=mail.your-server.de)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@rfdeck.de>)
	id 1xXFip-0006Tr-0A;
	Sat, 28 Nov 2026 11:31:59 +0100
Date: Sat, 28 Nov 2026 11:31:58 +0100
Message-ID: <20261128113158.Horde.SfK8gVRYJBkGjFr0f3N_Xrz@mail.your-server.de>
From: martin@rfdeck.de
To: Aaron Beckendorf <albecken@mtu.edu>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Devin <lucid_duck@justthetip.ca>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: connac: honour injected HT/VHT rate and
 bandwidth
In-Reply-To: <20261104142737.186484-1-albecken@mtu.edu>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)

Aaron Beckendorf <albecken@mtu.edu> wrote:

Hi Aaron,

I tried v2 on an MT7921AU (Ubuntu kernel 7.0.0-43, firmware 20240219;
the hunk applies to the 7.0 file after moving the context, only
mt76-connac-lib rebuilt), injecting on 5 GHz channel 36 at 80 MHz,
with three rtw88 sniffers:

- broadcast data frames go out with the injected rate: HT MCS7, VHT
   MCS7/8/9 at 80 MHz, VHT MCS9 at 40 MHz and VHT MCS7/9 NSS2 at 80 MHz
   were received as requested, one copy each
- short GI is not taken over: VHT MCS9 with the radiotap SGI flag
   arrives with long GI (the patch doesn't set the GI bit)

> Legacy injection and the normal (non-fixed-rate) data path are
> unchanged.

That path keeps injected unicast data frames off the air on 5 GHz,
with and without the patch: no frame at any of the sniffers, at any
requested rate, also at 6 Mbit/s, while broadcast frames on the same
channel go out. With kprobes: mt76_connac2_mac_write_txwi_80211() sets
MT_TXD2_FIX_RATE only for non-data and multicast frames, so a unicast
data frame never reaches mt76_connac2_mac_tx_rate_val() and takes the
rate from the global wcid's WTBL entry, CCK 1 Mbit/s. On 2.4 GHz such
frames go out at 1 Mbit/s with retries whatever the radiotap header
asks for; on 5 GHz there is no CCK and the firmware drops them without
a status.

Maybe set the fixed rate for all injected frames
(IEEE80211_TX_CTL_INJECTED), not only for mgmt and multicast, and take
the GI from IEEE80211_TX_RC_SHORT_GI?

For the broadcast HT/VHT rate and bandwidth part, on MT7921AU, USB,
5 GHz:

Tested-by: Martin <martin@rfdeck.de>

Thanks,
Martin

