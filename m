Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283680;
	b=yC97TV3sgavDa8pO6ueRYW0JxAbHSX2kGRdoEw6wEzW3F0r8Cr+TpOkksxXzRqwREHip
	 E9NwYlNNmrC4GFs3DHOPlJL9WIdkMwm0EMN6OKo2762oFDvQyR2kYAz3xZveLrRmdPH0I
	 hKExneliTAcgkfx7cA249G6QUkLhgWVgdi3zg1qhfUL3cHsO0N7Xh0oj+naeYw/ANdKnx
	 6V0r6UqGoRPrEcbhxC0AACOWsx8TEtz8FwcPF5KdXI3YOT5NOzhOpAkwyQDAoMxGHVFOj
	 FGvL76nHlcgSrZD7Sradw4eDvx3c00+KW22nRaFadLb3atNvqEhhrwvXvJjEOwI7Zxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=;
	b=dY4yRhTdAvYtvXiTVND4x72zFC5z7t3ynMorYp4n+F5TW4ZiWmXBsiQhXvblEl+4xfP7
	 6erp8mhUuEy0JuzL7PSm+VuepUO5rCkX23GbdszwkJsKtqM4noHzexK1EbRkR/QmW1z9g
	 bu3C4gMCP0hnmGTJCwWAWHoasWUu2dov9P8XkSsseKqWjiVnQZU0k07JbGVPeVuZ6zMUi
	 PorgDUWvjj1SoMF2pNU1w223Zyul5FIQD+G/9ryt2FG9tfdJreRM2y7olEEqX8HR90+gA
	 zyBn4qy0NtbrJpshBIS37xsaIsewr4JDVjtZTg/9lEZtc13p21XCRnIQqaiqrb+bPUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=w7YMfurZ;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC132606A336
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 17:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC132606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=w7YMfurZ
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c511cdd5a82so232546166b.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 09:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283678; x=1795888478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=;
        b=w7YMfurZY/rK8hrr8RSamu6tow1zgVjhLVjEyzxMuQS9kCpt+b2VysZBGUuURdXQsN
         hpz77FcVNlDZ2ZcfgIQiGk2x9SrxN0EsqyGa6zOKnU8sps1RnnSFWvhCGQHqBpdjEIcs
         AV/pM8QQTVdynp0IK9sVvq3r2RnG9hWBgGBVyXDIeoGv9ybPmEvB4SIMXyY2FWpNDN8N
         nsHaojyv34BVbvc4x225BHtcrxjpu48bO+h3KZI6oTm2k0ASo0ZW3/6Aw+YslqETsR1/
         wQlE7IBD7jmfob8ozeg+6nZaNQ5vfZbXlixilzo1FU3VKLObRR2M97FW52i7HqI7bPAA
         ws0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283678; x=1795888478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=;
        b=RjXOOYK/7qMBb4pR/EfWt5YzS7UESwWdRror59lLDIhznkN+c4mCTIuJbOcWoud1SA
         P6Iuw6izK5ptW5FRw5froSRURMCVrQFuf2I06D30QrjijTiioGwoFjteMmr+C3Eg4yAi
         GMqbBpn+9Ru1bCiQzaZh1sQ0A+ySjPIS0H1408mQN+vVVtS7dzPKJ35E5li995nexyIH
         htM8zI/9Ke0EhlPWEO6VYzp8+Jr2QVeWp9oiVwUc2+JST2ROt5+x42DeoB72q17FwXSR
         2iTaKiVqG5JHL97UHw7vitkKWqArUJTVcz9kO+vLk8ElU4z36Gi6YHJXsAjNTogV+dgo
         w1ew==
X-Forwarded-Encrypted: i=1; AL+hErFdD2hU3sJeMy2ftEdFudJR8aK66HTK7w9EKglfUTjTNfPSM14XJRYs7SCwDliXnWrX1gvRL+YfP3MjDDbCWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9s9f9rSM19uqrlV6jp5T5OiMvrQmA/vsRCpa8+86QkoM8DQBuu
	Zd/shVzKxFW+5f+0ZSLle4WvKY9XexFkB0it1v9PGH/TKJkslTGVRLIwSBb0zDkmlA4mqG/Ylqx
	Cl33VNI58
X-Gm-Gg: AZFdTZejLPUt10MpVjojVfTZ2Lzw2IIFPvwNsu8/NUs9Tf6zs7hqzQHroveydsW7UOD
	dHMPh2r3ns9S1fwFxCWkUL8SDAavvfYYAj6Mk+T8OCjsoFB4pT6IClTjgTbXN2BJ4Ap5lzojdSX
	rgsBaRpeoLuBnZKaSG/Gq/oCGXmCcLORaVmNQLdIZAonF+hCwXIeJL5s2IKlieJG8veckuKXHd3
	50ahm6MA2EWyMq1AuLlOQWvw9nvJEF4NgMXyWi7FC0hFy4NgN3U/8WwdjhZMa3fOqVy2lb+KXgM
	75XsRFfwjU+sMu3S8rnPPRhF4pcFa6gXFr43D5UhuWF8jebNpl1n0BDLIRa8OkhK5G1514dhRGN
	4fmcZ6dXrEAeS4OiaAdDRJ1UlQBsAvkcR62I6IA0qXM/gXvMeLk/I96Kh2M+6LLATD+3Cyv2EPU
	+4sUJrQluCbn7DA0d1HqIk42OW1BCmJD9b/IBQezPeKZHx2WnItfVmmDrJWZVEecALBUVOYjm1K
	HE5ctpVovoelj8kMJGm3rMbYCA+4AVCaoXIOO66y9U2qCzsxtGwkLcuzFoLYE2m3OmpPu56PdO1
	1Wfa9hWirfqkxIwAFzebn8GUZFoGJGAJDJOPZOwhDvxxkeCvof9sSrc9dtO7R2DiWTlhxfUFpe1
	j3FvGqswjbBren6Dd4XDE0ghTSvuTdQkwhrn4/F7bZk2ZAdtk2G71cLcYZXyWETI2mG/FVmX4S6
	KTTz6D8WDF5N1Bi6IJdxX3tcqr+qvgcFpEcQFcLtUKVuSKKxTeCozZRZD22PZX6dbbxmE1d8fsx
	DAfFa6Ip5chCSI6CS27aFLn3n+UOy39VsdqrWT8qBT5tsltYj+/oLB6nLCyfdBZgYdTdCgg9eE8
	xRb5Ni1qOepG/H5WRA9BX1moOi0dKvUHqdQpo1VfXWKNlqh1fhE2xxee3z3xK/o2leR+smiv2kq
	u
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr179230966b.1.1795283678143;
        Sat, 21 Nov 2026 09:54:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm213191666b.36.2026.11.21.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: loic.poulain@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:37 +0100
Message-ID: <20261121175437.648605-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com> <20261114210506.787342-1-julius@bairaktaris.de> <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
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

On Mon, Nov 16, 2026 at 4:25 PM Loic Poulain wrote:
> So, from what you say I understand pci_alloc_irq_vectors_affinity() is
> the wrong API here because it sizes the allocation around CPUs,
> whereas your goal is to size the allocation around device
> CE/capability (8 vectors).

Yes.

> Can you mention cfe9011a05a8 ("ath10k: remove MSI range support").
> And why we re-introduce MIS support and how is it different from
> previous implementation?

Agreed. The v2 2/2 message names it, gives its reasons, and says that
its per copy engine handlers and tasklets do not come back: every
vector gets ath10k_pci_interrupt_handler(), which schedules the one
NAPI, so only the CPU of the HTT copy engine's interrupt changes.

> Also, you should update the comment/kdoc for
> ath10k_pci_per_engine_handler() which says MSI interrupts are not
> handled there.

Agreed. That function went with cfe9011a05a8; the stale comment sits
above ath10k_pci_interrupt_handler(), and v2 rewrites it.

v2: https://lore.kernel.org/all/20261121175402.644803-1-julius@bairaktaris.de/

Julius
