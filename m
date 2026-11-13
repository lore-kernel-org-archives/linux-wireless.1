Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582057;
	b=Dl12bY/g0t83A7nPwZwmKXt9mYs7TOVKp8E4xl2DlYyoxTGgVD+hxtWqkSj+Hfz4MtLj
	 9tX+4izWM8137pUF6JffaOeaDR9T3alNYLTYHEwb0ds+w6ADjF4u7iPT/LGHUSvgsglSS
	 sZG7R/VBm0ZZR8VqH1K+IxMds/LcYxwPnd9ej2resdWSNo4bBQslM/EZapKPYkyz2VRyb
	 RwQyHxyMHOBUAiEorsRQpnTvDW99+nBzppWSLJgMRhkWvRmNn/l6WVqG97kFfZFhEVRIb
	 3AnJhXkuRZpziOuqWN+RTZdDGcMZoG1eisnYA7IpOk+tv+JvI+TQv9hhUk4Kz3T1cBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582057;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WHxgI6ZxGrcyJOkoziF9lizfIwye/z/WeqGOY+/7iAI=;
	b=EclkpmENH63KDktmBTYj9ggDZUzCy6n3HIThoarXGbgkPBiRAgmWgKysC9Y1qBai1Wog
	 UBMSXeOzG+zCU+f2oaBoU9kR5mCOXFmjWrwl3CYBhbxlRNDcWtwoTOUTMDbUye4jmnbvL
	 VTh5K3pcDz4hZ96Oodio6y+d6ytzFsXJlIFK3lfUqjKdIc+NATrdOhHHofdrDYH0+H5YW
	 KiOah2SzWSIEwyyQw3cj4JOh6/S8heAGAzFkKmtElRwGH/OEj7vsjkyvi3XtyL+auRkk4
	 87gQ2L17cZOzYVxwzJb6Qej0J6yOONDTf6vMtLQKFXqSMs7QKxVNiJR7DZ/HIKZUBmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=caV35DWM;
	arc=none smtp.remote-ip=91.218.175.238
Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45F3606A335
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 15:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E45F3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=caV35DWM
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JERCByHRcFswCMRIp7ZgnuDubEntCiw564wOAorzM64=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794582054; v=1; x=1795186854;
 b=caV35DWMeipYygwUnPo5QL/N8tdkm7XeUxywRdPyML0iowhiFIFCICZY0baCKuFNqjKFGN7q
 i1lCQ/xl7GZlfLyE9ePvuKr2V1qC8rehg4cy0FZsopropu4eBQnEPEfns47ICE3xMMakz154TCW
 IAGARcwhZq5gDwjZ3XMF/CZsl6h4njFLVpIPUokRFo3mYscAc6xse81TlSjbkCIJD1geJEY4in4
 /1JzDuZbK86M2un2RIVO6fD8RGxPW1+Mjh88+6luVzQjkFRj+w/F03n2i4SnYmgz/536zmnSNco
 1DQJMx97a8AfH+pmoExzMk6Z6ZDGRpujSfzgjjbnlmzjA==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b6aa8bdc30aaf8f3;
	Fri, 13 Nov 2026 15:00:51 +0000
X-Mizu-Trace-ID: b6aa8bdc30aaf8f3
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Michael Shih <michael.shih@mediatek.com>
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kun.wu@mediatek.com,
	deren.wu@mediatek.com,
	sean.wang@mediatek.com,
	quan.zhou@mediatek.com,
	ryder.lee@mediatek.com,
	leon.yen@mediatek.com,
	litien.chang@mediatek.com,
	jb.tsai@mediatek.com,
	eason.Lai@mediatek.com,
	Chris Kelly <hoopyfrood42@gmail.com>
Subject: Re: [PATCH v5 2/2] wifi: mt76: mt7925: support per-channel survey dump during scan
Date: Fri, 13 Nov 2026 08:00:48 -0700
Message-ID: <20261113150048.5271-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112075558.1813785-3-michael.shih@mediatek.com>
References: <20260831032832.83338-1-eason.lai@mediatek.com> <20261112075558.1813785-1-michael.shih@mediatek.com> <20261112075558.1813785-3-michael.shih@mediatek.com>
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

On Thu, Nov 12, 2026 at 03:55:57PM +0800, Michael Shih wrote:
> (1) Home/operating channel (periodic mac_work):

At USB 3.0 and on PCIe the periodic query is no trouble. At USB 2.0
it times out under traffic and the chip gets reset:

  mt7925u 5-1:1.0: Message 00030022 (seq 11) timeout

  runs with a reset                      stock    series
  USB 2.0, v7.4-rc1                      0 of 4   6 of 6
  USB 3.0, v7.4-rc1                      0 of 2   0 of 4
  PCIe, 7.3.4 + morrownr/mt76 38f40b4c   0 of 4   0 of 5

USB is a Netgear A9000 on firmware 20260813 and 20261016, PCIe an
MT7925 (ASPM off) and an MT7927. Each run is a 20 s upload and a 60 s
download as a station. The MT7927 shows no transmit time while
uploading; the MT7925 does.

My own patch for these counters [1] trips over the same thing, so its
v2 is on hold. Asked by hand, the firmware still answers several
times slower during a USB 2.0 download.

> (2) Scanned channels (scan-done event):

Scanned channels stay empty. Both firmware versions send eight bytes
per channel in the scan-done event.

[1] https://lore.kernel.org/linux-wireless/20261023180554.7266-1-lucid_duck@justthetip.ca/

Devin
