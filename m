Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.102.156.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491549;
	b=PSFMLuFFqpCp5Epfyyks4X6bfEPP+E1KZ0fUZ+KcjXKIm5A6VDNQpPi8o9S1q6xhfVCc
	 yoNugzISvzvMOAlHv0ANl/u/HCKp3+H0UNIQDyiypkpuVZSI/9cDlRGaSpfqhmqEUvuSC
	 /NpH+6fPYtWmq/OfC8nvmn60oA2b9mWurEabG8toFZjF9C62Da2Ay/RshNVvZrdgotdpC
	 xN/twYB1j8vDFc6XebuF7TgSNyBNyG5xPFG7fkztgJq/txbwkfsnNIuZITNcBrs2vRjNE
	 l8Arq8wFsvpqNwlSXxZtCPn3U/XPk92PrYZ6bBr9VJBuet5lewzlZP+grhQLOltiD1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491549;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:User-Agent:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=FQEToc/tllkwE/usKVnhOlAx/N0Rs4tX+3kATA9NrBg=;
	b=3vTEgzmMSqJkR5wvesg61MmOe2jo7XnBa7KldOLKD4cIYB5ztQNaSGmg9CK0KtR7lPvD
	 dTCp0yWTyKx9RluQ8ULdXrqXLCucOeYHj2Bl5Q9HH2VkGWbcgD/LQbwMUmK2GHkv3cBJB
	 1OjwxMokkfjhLSKnljmicUmoA1gt9kHmH1QhSJRGrmi7NA/E4tDq65Y19xvFa58TB0aE+
	 GsP/arBGkhFpy18vVlPdyT0B4UVgp3xVwgsYooJ+D3O/NqJUcsj8ly1k0VB3ANseDeuKM
	 Mo2BY4Y6nQuY8zgHW8QjyEjkdC6ZmMSDGxqu6cQz9DENikwK2pGPghC0jW3OT1mzKIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thregr.org;
	spf=pass smtp.mailfrom=thregr.org;
	dkim=pass header.d=thregr.org header.i=@thregr.org header.a=rsa-sha256 header.s=v1 header.b=t6MT0ktN;
	arc=none smtp.remote-ip=46.102.156.145
Received: from erc.corrupted.graphics (erc.corrupted.graphics [46.102.156.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422A5606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 422A5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=thregr.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thregr.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thregr.org header.i=@thregr.org header.a=rsa-sha256 header.s=v1 header.b=t6MT0ktN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thregr.org;
	s=v1; h=Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	In-Reply-To:References; bh=FQEToc/tllkwE/usKVnhOlAx/N0Rs4tX+3kATA9NrBg=; b=t6
	MT0ktNgsaefXAJFNNX6ger94HQZcOCpKz+2oDCmjK3qvopSRlTJJtJkfTVoI6q7oLWMso+jZJEMRm
	EjfUUyKzgaErZSoqvXMHD1qScHYjKy8B+T+OqCMIS1MkOyi/K5dMmy57D+VHiOJE+YmWOFKQ4HLhA
	/ED7BMUUgAXk7jSuGk/ZkGx2dT8Fd3KzXTByOD9nDNboaJw2exmU24sSU+jbEPa/a8XUsY49mb2uy
	yXCLG8l7W/am9ikyQ6v93DlkeU+A8mcWfbMxIAY1J/OomNSML7ps6nPXND9z2TWIoPk/wGpFenq3N
	chZMijAxPqsHaxQHZa5ywZiKGWRAe4TA==;
Received: from 78-213-86-123.subs.proxad.net ([78.213.86.123] helo=localhost)
	by erc.corrupted.graphics with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:SECP256R1)
	id 1xRVE7-00000000ASv-2SOc (envelope-from <wavexx@thregr.org>);
	Thu, 12 Nov 2026 14:52:31 +0100
From: Yuri D'Elia <wavexx@thregr.org>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
    Ryder Lee <ryder.lee@mediatek.com>,
    Shayne Chen <shayne.chen@mediatek.com>,
    Sean Wang <sean.wang@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>,
    Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>,
    linux-mediatek@lists.infradead.org
Subject: mt7925e: TX throughput collapses without RX traffic
User-Agent: mu4e 1.14.5-pre1; emacs 32.0.50
Date: Thu, 12 Nov 2026 14:52:26 +0100
Message-ID: <871p8q2m3p.fsf@wavexx.thregr.org>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi,

I'm using an ASUS ProArt PX13 with an MT7925 that performs randomly.
Sometimes it has decent throughput, sometimes drops to a crawl.

TX throughput collapses whenever the host is not also receiving traffic.
RX is fine.

I'm on 2.4 GHz 802.11n/HT 20 MHz, MCS7 both ways.
The peer I'm testing against is another client on the same AP.

I did a UDP test with 1200 byte packets, sending at 5 to 40 Mbit/s:

  MT7925 -> peer:
     0.6-1.0 Mbit/s received at any sending rate, 1-2 s queueing
  MT7925 -> peer, while peer sends ~200 pkt/s to MT7925:
     5.0-5.8 Mbit/s received, ~0.13 s queueing
  peer -> MT7925:
     all received up to ~20 Mbit/s, no loss

Same result on:
- kernels 6.18.62, 7.3.3, 7.4-rc1
- MT firmware 20260605184805, 20260813113118, 20261016233029

The following had no effect:
- ASPM L1/L1.1/L1.2 off, runtime-pm and deep-sleep off, power_save off
- AQL off
- TX A-MPDU sessions kept stopped
- IOMMU group switched to identity
- Bluetooth rfkill-blocked

What I see in the driver:
- Without RX traffic, frames go out in bursts of ~48 (the UDP socket
  buffer), then nothing until the next TX-free report, up to ~1 s.
- I sampled WFDMA registers through regidx/regval during a stall
  (~7 samples/s, ~20 s): RX ring 2 DMA index always matches the
  driver tail within one sample, the RX data interrupt was always
  enabled, and HOST_INT_STA has nothing pending. Ring 2 advances by
  only ~13 entries while ~1180 frames were sent.
- Wi-Fi IRQs: ~2.6/s idle, ~82/s during the stall.

So the driver processes ring 2 quickly. The firmware seems to write
TXRX_NOTIFY only about once per second when there is no RX traffic,
and sooner when RX traffic arrives, which would explain the seemingly
"random" performance.

There are several reports of poor MT7925 throughput on linux-wireless,
the kernel bugzilla and the openwrt/mt76 tracker, but I didn't find
any that points to this.

Is there a firmware setting for the TX-free report interval or
threshold that mt7925 should send at init? I can test patches and
provide more data.

Thanks
