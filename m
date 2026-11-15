Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769135;
	b=Y3NwNSDZmndhoX25f8O01eavOJrXJltiuy5jpiKgm9f13y4xRfFvq6o2jKC4JhTYwgun
	 IQxXGLo9dQK3zgM55XRbcEeydtSr+h08LoDyPUp13DGVseny4tqBMbhgeBHOY0EVZRGH1
	 +Kd7SUc0vooVmWsJw4tXHxdAgeg2W4IlmyZeTtsGIp2PA7+uVy+7SJkrEfxnuTDq3Z+Cs
	 A8zNZ9o0GlJRXJu9ECVGabYca9/MbljU5/Z/QKQbqMGLCVuFr9cnb27Xemhpv+shKDUwx
	 s7XUCCI0REkbzK1t5PpPlHKoaPRC59gPu/whJLIsx5buWcedaKHYDDmBkS6qzwglEUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
	b=QhjtwIPn2JgCrdlwzPKpY3k8zJwLTAs4BcIvTye0CAHki2ykFBKnN73Uzi2ZoZxeOCpZ
	 vPfSBiXdgQ8g6dpDfqXKyx4eoYfgUoTpaigHY+IEdTHr5JXJvU+wo8NkaS/Ca1QBk6XVj
	 V9OO8G3DY2CuNchOOgq9AwV1JIdawSubYN9Leqo7WjOblbJg1s+pMXcPdpg1JRPXDcHxW
	 z8it0ur69FGrllveFTc4Tqf/BIN1VSBaVCnS07MzJXay+g4J758KDK/KRp9XkPX06eHnQ
	 D9zdaCK1WwLtaa0XJbm4VrFQSSWuhiDwLXE9AHxc6CQLKrv3vB8E88UxKJFmJoCrhRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEK1UAhv;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D45606A8AC
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 18:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D45606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEK1UAhv
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso3032516c88.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 10:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769134; x=1795373934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
        b=nEK1UAhvCMl01hvbouw9seyvdetcS4NCdpZI7UFQbJEL+LLeSBaHvb8KFWmRuCJfkV
         wVeZ4YSQsMIrpa+2X6DKlbJlgoTg3Y+K9dp6SFjRqFqKQ0fJb9nBqkZQ8su92THTj4gb
         sufwRzJwLHbceHUY3kSDb2c8k3MlubNfhEY5THsXsLbPNpl3rWaYcg8YosgRXgtxSVGo
         erSbOkTzlNfFR15748TrHeq1xlUzyuCnJ3xAObNHKEfVJlV86zk1lKT3ujHErpmuxIY0
         Cji2rpsQBLEULthGikGy+PXFm1Vc/7xa/aTxhP2SDpxFeL+ywg+3dAF0A8YOPmA1/ydd
         zfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769134; x=1795373934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
        b=ffFm1sZ+WWijSrUOKJwEGcrmM9isi4omddDMd7TZMw7Fm8xSUQKsWAUSHyj96i+kkE
         +KF5wwO/gX/zEVDnBx/Q5ifAHYWN7MX9hHfCZeD3kvBmusiDNIphTZx0i2lwfdWiHIef
         AeCufweIVrQSzhe7/0AyCYB1MmGzEB5U19bYS+Q8Nh0+69nys45f9j/vb40R952kjS4H
         sAxkOuwCbTEaLK4+1L6zghhT2e7O1M8QOgQilyRYb28l3m5BWigj5AGMx4xm/CTklp23
         sZGCw3uoJRZLNp8yZuU61ltEgeIZWiysl20oB9AHswJMPeYE4xSGm7OazCPO5d2R2k/y
         5QNQ==
X-Gm-Message-State: APuU4Z/wMca0Vmdl0DEfGcJZ1kk1y8U5EC6hj7A1dfKcYPRcDXRbYBuN
	VB24kkhxqvWE61+MVCcJBw+0DSY0gffo61JXmuIV7AK+NMz3o/nf6Apd
X-Gm-Gg: AYBFou0SRVr6ZEJS6uyPjqwV5enrZST2fZEXpbF6dvN0rOtHLbRhf1526EuNDC5md6v
	/jQvfVigojz2srefKD1dH9aDfNfox8X4MtM2/pu1d8J5VfTDWWK2zCpzwyCrl911sDDmNt5S/a3
	FZgw32MwKEtuXh+oxz3L3ChP5674y6tscOFbSX++/HuZFV6kDIEE56iHuHX17NmftuHkKkCDaTe
	ezOsEw3z27YyNRnj07ReLvHmVYVvZNx14gArIIXBdbLyGgf2PzT2cEtUqE4ubQXz3+rhR95DmOj
	SnoqXNAMm635MSqVpOQ5s0H+T5H80PmYSbdO5/xwmego7ceRbWWt7/1TWRSbt1zNVl4+1z+G7fd
	F4NCyvpdHaB/u2dzgmIpJu01H9x8bdJ/Y/LsxH++3O3eZ818TY5G35v4ZCZqlqf+C0sSfLqyrI8
	DoeGf4uay2yP9QnM+G4/ZaOO/9Dy3IshNKZ9D5YBx4pStlz0zDd6a1HpjLlBEPWO4gtzH1Zyqg6
	893igNip8kQEBuPnyasdCk2qOa0ScfluKgQGstK3afIPM0oLM/wdZRk57+LLq6Dj3HMPFdTtFT6
	pUlIGZprbNWmPDX/O4W4p2vydXmRGRkATQV/NhTuMgFWcGO6RTFcuAYZxtVmxkppEWzFlGnomAQ
	=
X-Received: by 2002:a05:7022:8f:b0:191:444:425 with SMTP id a92af1059eb24-1b50306832fmr7755064c88.2.1794769133806;
        Sun, 15 Nov 2026 10:58:53 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:53 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 2/2] wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index
Date: Mon, 16 Nov 2026 02:58:43 +0800
Message-Id: <20261115185843.64633-3-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115185843.64633-1-maoyixie.tju@gmail.com>
References: <20261115185843.64633-1-maoyixie.tju@gmail.com>
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

brcmf_fws_macdesc_indicate() stores the interface index of a
MACDESC_ADD signal without a check. brcmf_fws_macdesc_closed() later
uses it as an index.

	if_entry = &fws->desc.iface[entry->interface_id];

A device that reports an index of BRCMF_MAX_IFS or more makes this read
past iface[]. On USB this parser runs with the default module
parameters. Reject such a signal as
brcmf_fws_interface_state_indicate() does, and count it as a failed
update.

This was found with a static analysis tool that we develop. A userspace
harness that compiles the fwsignal.c functions unchanged shows the
out-of-bounds index under UBSAN before this patch, but not after it. No
hardware was available for testing.

Fixes: b75c1a301b7d ("brcmfmac: destination mac closed when interface is closed")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index e81105154d6543..56eb2c2943dbe8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1010,7 +1010,7 @@ int brcmf_fws_macdesc_indicate(struct brcmf_fws_info *fws, u8 type, u8 *data)
 
 	existing = brcmf_fws_macdesc_lookup(fws, addr);
 	if (IS_ERR(existing)) {
-		if (!entry->occupied) {
+		if (!entry->occupied && ifidx < BRCMF_MAX_IFS) {
 			brcmf_fws_lock(fws);
 			entry->mac_handle = mac_handle;
 			brcmf_fws_macdesc_init(entry, addr, ifidx);
-- 
2.34.1

