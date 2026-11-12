Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506207;
	b=aZsl2C1eAHXtrNeHJ1fDY3cwv46z3mJLSfdXycgJOsYmBSzgPxthiaXjzKZ04z7doMiD
	 3VweDR2jJjse4PlwHcUiLJXaDc1XUXgj/1IQe80DjL+dJ+Y14wmUb9s34N6IQwjtvr0sd
	 3imfXlrLiXtTeOKmuE69lZEiVXp2DFJ7ePqvy7H60eqNaJx4jG/b5Xz/kC19NEtcKm0kB
	 S7lbg8n3SUnMqg6SwQUf5MFcE944iqeiO7TQW/tJorSSi0UrzOfUBUZ7A/Sdocxf+dvY2
	 6xlEoviq7l4uigloJ80nVzBSlCvivFuwf/XebM/LtWFJsMYn8f5GZfAEeTkV0eX6n6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nNm8Cx2ZfHbw8ESTnrWh1uOe82GeZsKFiVEtoCEnJGE=;
	b=3yMZUHIQw+irkXhhjhCJddIvsNz8ZLHJ6CBWPTGlHrkrOkkH3AXe+YfkZeTAC9/pI9e0
	 t62uwolb4EYsNUeqtBACHZN1HI9B0ZPUXODlaCpuPmz/TE8w43At0EjS0lH0Zv51bDD97
	 9oiPZ2+b6hRPSQz4Tu5K+fLvT2OglvatHZQshXS1j0dPAeLyzSbKB7UnWWjgxVVaoRuFQ
	 /0PHOEWUa9dWXilFMfeSDOLeDHIM7u4bbM6A4AKklK5DKySxMS9kOvyVlxjRDdWg0v9Le
	 gwXmlEggoMGqvIjDSiDEzOiBDE0lxWAUN3bvJj1pfn6LZFx21gx7zqbK7aWg9fubIzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQHo2KIP;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0249C60A2634
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 17:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0249C60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQHo2KIP
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49318428d98so21415f8f.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506205; x=1795111005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNm8Cx2ZfHbw8ESTnrWh1uOe82GeZsKFiVEtoCEnJGE=;
        b=CQHo2KIPRQenaqgEzE2NoSegb7WfWqir3iaN4h22UZ2lsokznkDCJ9BQ50/QIEr39X
         SEj0M8yyiAu5UfFhMzsPYNkJq0KJFEvqOb82y2irGjhYO0uKliAXFOcw6WBkOtlaDEev
         ge0nAxzVnn0RemgEhMj8Rx5ruBBYj9AHHPgsM454AZ5LCMss9GKhngC5xV/zlJp810mu
         ICiUmA5MkZz0UvkPFJRHsOR5pVCH4sNVgqOKRcQ3A02WAVEYLI9QxgjBn4oarpb5pQb7
         cTXbJIZwsiIOs59TAJOJ1u2gTY7mSQrAuyKp//cBinHMF/y0DOvxI7y8hqnx7qV7/bt3
         3A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506205; x=1795111005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNm8Cx2ZfHbw8ESTnrWh1uOe82GeZsKFiVEtoCEnJGE=;
        b=QqX98yErDpu0HTm2M4LFNKqqdCiCUNGiGIJUIRarBcfPfUmOL/JMU5hUY8fSss6CYp
         77ktg5OAVGezgUit8naQu1cq7kjFPniY2nkAOsy2WwLsBlos3tun/511VPwVGFIpCQ3X
         knaYE4vaLLPQ4xidhVp1cbGq+hUezQIFpHAGnN7MDaALIqnpb61MhT8VfsFc9WQg9oAZ
         tuuXG+mQzsRUWGdotq8VyTn0mQDlIs8QOOa8QIcIl8hqccThoUvUIBcU0SVt/4ZWeKLP
         IADD++kW+FvI4nHTS71FOBwVz258u9WcdAYBa8AGbf4VgEe2vP0dbICgCMPQtnZ2xZbo
         5CQw==
X-Gm-Message-State: APuU4Z8LvXj2xjZzIP47gDkbUs2XFbk3LxjTMueyTi45VvXUh0XUYi3N
	RRMy/2cfscJ0aDnpUxu50cdneWDeBSBH62W4CaAKaYeClNJ+wQINBcJgkCPnOeMCBPI=
X-Gm-Gg: AYBFou3gf2PQVzz7piXan2cN6Wq8F+Ba/YaTeJr9S4BpTUmZUDpFGOmdkcm6BIto5Qs
	0kJV0jn32aROAK45LTJHb7588zYvdoMSIQNhbfGVjm0PYjdXlm8OJ1Ma3OOFJ5U5v3siyXBV9ke
	THeGHKkYrz9PCaoBSxTOzCz3onyRGzi6VE+fGh67wgmtVz//UlkR0NueSGOEkW70H8+Sa1n5U3y
	mpNKZXoYA3Qzd4I55kbwZG7WvGERJwgyqRPKYqmArMp6BrAhfxzMEYReNjeAw2Sam4SUsnRq7EP
	D1xCpys8pMkLjMgh93+Yd4Xl8SglpDpPkSRntpL9AfDmluT7w+4DnTQu84SpHa2e13JqEqkAwou
	Or7fr/boMv3hwcUXQ65w35CapSJ1w/KXKH5CgQnYhKfR2HNVRmqhDgTxZcHb3M/3CzhUuzT1gYa
	QrV37og08o2+rJJgoAzBiKvAJELl9it2xZU8rMkXRWfJZqFpsSpasO03Nvm4EzoV5n19awoFNSw
	9tKKSPheKxHv5jvSXPdt+xXzu5y2VcqHDhG96hHoKf4SAuZR4lNup0vnHLZZDP/x3L4KoigOkQA
	xiyed3pV2cFKHkz72sJqLfAWFoqol1bNeoxda413+8igvEU6Txs6bBf5X9MC5AgVwQtzZCtDaDa
	ruFsMrVlvyEqIZwdAeqTeDoFB442wt5hwd5qtGhtpcI/YcEv2c5Rm4EYm+0zi7fAtnoYpV/G+ot
	LLmGibYUHw1COY4lLibjmvWnjVpM3oXTcQgEyjfT8sUDrNlcWEYCmX6ujTmTYbsoo=
X-Received: by 2002:a05:6000:2288:b0:49c:6a45:ca33 with SMTP id ffacd0b85a97d-49c70ed923amr259032f8f.9.1794506205465;
        Thu, 12 Nov 2026 09:56:45 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c193fsm547430f8f.13.2026.11.12.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:44 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 3/4] wifi: b43: RX header handling for the AC microcode
Date: Thu, 12 Nov 2026 18:56:39 +0100
Message-ID: <20261112175640.40603-4-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175640.40603-1-gonsolo@gmail.com>
References: <20261112175640.40603-1-gonsolo@gmail.com>
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

The RX header of the AC microcode keeps the MAC status at 0x10, the TSF at
0x14, an 11ac chanspec at 0x16 and the power of the two antennas at 0x09
and 0x0a. Decode the channel (including the 80 MHz block with the position
of the primary channel), the signal, and the HT-SIG and VHT-SIG-A bytes
that precede the frame for the rate, bandwidth, guard interval, coding
and stream count.

The microcode sets the decryption error bit on frames it never decrypted,
because no hardware key is programmed (the 4-way handshake message 3 and
DHCP replies carry it). Pass such frames up; mac80211's own decryption
still rejects anything corrupt.

Only microcode revision 832 has been tested.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/xmit.c | 91 ++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/xmit.c b/drivers/net/wireless/broadcom/b43/xmit.c
index cf9e7a5..dee6cc6 100644
--- a/drivers/net/wireless/broadcom/b43/xmit.c
+++ b/drivers/net/wireless/broadcom/b43/xmit.c
@@ -855,6 +855,7 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 	u32 macstat;
 	u16 chanid;
 	int padding, rate_idx;
+	s8 ac_signal = 0;
 
 	memset(&status, 0, sizeof(status));
 
@@ -874,6 +875,31 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 		chanstat = le16_to_cpu(rxhdr->format_351.channel);
 		break;
 	}
+	if (b43_ucode_is_ac(dev)) {
+		/* AC ucode (rev 40+) header: RxStatus1 @0x10, TSF @0x14,
+		 * 11ac-style chanspec @0x16, per-antenna power @0x09/0x0a.
+		 */
+		const u8 *h = _rxhdr;
+		u16 cs = get_unaligned_le16(h + 0x16);
+		s8 p0 = h[0x09], p1 = h[0x0a];
+
+		macstat = get_unaligned_le16(h + 0x10);
+		mactime = get_unaligned_le16(h + 0x14);
+		/* 80 MHz chanspec: centre channel and the primary's position */
+		if ((cs & 0x3800) == 0x2000)
+			cs = (cs & 0xff00) |
+			     ((cs & 0xff) - 6 + 4 * ((cs >> 8) & 0x7));
+		chanstat = ((cs & 0xff) << B43_RX_CHAN_ID_SHIFT) |
+			   B43_PHYTYPE_N;
+		if ((cs & 0xc000) == 0xc000)
+			chanstat |= B43_RX_CHAN_5GHZ;
+		if (p0 == -128)
+			ac_signal = p1;
+		else if (p1 == -128)
+			ac_signal = p0;
+		else
+			ac_signal = max(p0, p1);
+	}
 
 	if (unlikely(macstat & B43_RX_MAC_FCSERR)) {
 		dev->wl->ieee_stats.dot11FCSErrorCount++;
@@ -884,10 +910,19 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 	if (phystat0 & B43_RX_PHYST0_SHORTPRMBL)
 		status.enc_flags |= RX_ENC_FLAG_SHORTPRE;
 	if (macstat & B43_RX_MAC_DECERR) {
-		/* Decryption with the given key failed.
-		 * Drop the packet. We also won't be able to decrypt it with
-		 * the key in software. */
-		goto drop;
+		/* The AC ucode sets this bit on frames it never decrypted: this
+		 * port programs no hardware keys on AC, and it shows up even on
+		 * unprotected EAPOL frames. Dropping here killed
+		 * 4-way handshake message 3 and DHCP replies; mac80211's own
+		 * software decryption still rejects anything really corrupt.
+		 */
+		if (b43_ucode_is_ac(dev)) {
+			b43dbg(dev->wl,
+			       "RX: DECERR passed up (len %u, macstat %04x)\n",
+			       skb->len, macstat);
+		} else {
+			goto drop;
+		}
 	}
 
 	/* Skip PLCP and padding */
@@ -931,7 +966,11 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 	}
 
 	/* Link quality statistics */
-	switch (chanstat & B43_RX_CHAN_PHYTYPE) {
+	switch (b43_ucode_is_ac(dev) ? B43_PHYTYPE_AC :
+		(chanstat & B43_RX_CHAN_PHYTYPE)) {
+	case B43_PHYTYPE_AC:
+		status.signal = ac_signal;
+		break;
 	case B43_PHYTYPE_HT:
 		/* TODO: is max the right choice? */
 		status.signal = max_t(__s8,
@@ -955,7 +994,47 @@ void b43_rx(struct b43_wldev *dev, struct sk_buff *skb, const void *_rxhdr)
 		break;
 	}
 
-	if (phystat0 & B43_RX_PHYST0_OFDM)
+	if (b43_ucode_is_ac(dev) &&
+	    (phystat0 & B43_RX_PHYST0_FTYPE) == B43_RX_PHYST0_PRE_N) {
+		/* HT frame: the six bytes before the frame are HT-SIG: MCS and
+		 * 40 MHz bit in byte 0, coding/STBC/short GI in byte 3.
+		 */
+		const u8 *sig = plcp->raw;
+
+		status.encoding = RX_ENC_HT;
+		if (sig[0] & 0x80)
+			status.bw = RATE_INFO_BW_40;
+		if (sig[3] & 0x80)
+			status.enc_flags |= RX_ENC_FLAG_SHORT_GI;
+		if (sig[3] & 0x40)
+			status.enc_flags |= RX_ENC_FLAG_LDPC;
+		status.enc_flags |= ((sig[3] >> 4) & 0x3)
+				    << RX_ENC_FLAG_STBC_SHIFT;
+		rate_idx = (sig[0] & 0x7f) <= 15 ? sig[0] & 0x7f : -1;
+	} else if (b43_ucode_is_ac(dev) &&
+		   (phystat0 & B43_RX_PHYST0_FTYPE) == B43_RX_PHYST0_STD_N) {
+		/* VHT: the six bytes are VHT-SIG-A1/A2 */
+		const u8 *p = plcp->raw;
+		u32 a1 = p[0] | (p[1] << 8) | (p[2] << 16);
+		u32 a2 = p[3] | (p[4] << 8) | (p[5] << 16);
+		u8 nsts = ((a1 >> 10) & 0x7) + 1;
+
+		status.encoding = RX_ENC_VHT;
+		if ((a1 & 0x3) == 1)
+			status.bw = RATE_INFO_BW_40;
+		else if ((a1 & 0x3) == 2)
+			status.bw = RATE_INFO_BW_80;
+		if (a1 & 0x8) {
+			status.enc_flags |= 1 << RX_ENC_FLAG_STBC_SHIFT;
+			nsts /= 2;
+		}
+		status.nss = max_t(u8, nsts, 1);
+		if (a2 & 0x1)
+			status.enc_flags |= RX_ENC_FLAG_SHORT_GI;
+		if (a2 & 0x4)
+			status.enc_flags |= RX_ENC_FLAG_LDPC;
+		rate_idx = ((a2 >> 4) & 0xf) <= 9 ? (a2 >> 4) & 0xf : -1;
+	} else if (phystat0 & B43_RX_PHYST0_OFDM)
 		rate_idx = b43_plcp_get_bitrate_idx_ofdm(plcp,
 					!!(chanstat & B43_RX_CHAN_5GHZ));
 	else
