Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646096;
	b=UwIx97VzQtnXA4BErL/HbCgThaSojbhJ+rGzLpIlfKbAf20cSYpPYRNMHATMlg9Tu/S+
	 1reQLae7vzKgAHpvHvGNyTHLuv5xiZGqGmCLQsbO2Ofb6uNW68eSmhCHAen70gCnLEkbV
	 Km1S5IOle7aeVO6BiW+X6yg8x+mOizOtziOb5kwprTBxKL3wm0WVQhQhfSQQfWzxfijM1
	 u50u/1NzBEMuHyPW6t21J49hyIjdmcIHXJN3otK0MI/jBaOH6zmTPE/cDxm+yVbeoQn4N
	 O4l746OIVBInWLJw8DRYXJ0RrXEyPU8sx2jWq8Wo20i8x0tm6KqON3x57Q7W7aGSYnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646096;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0KVO+R8IkPB9qqtoJ3ePZ0ttG/txq7Z92Z+7D0sksZM=;
	b=fxaMYs67fD7/+qWXYQ/YEOoXsow4goJX0gEZmAmmrrPcSX2pQdNCtHxhe4BReGBtik7l
	 nROpIlEbovB+u7geg/pAOSjIcoY323I6V+MYj1FCST8E1qtLDXLGpuLhfNqD8e4Zcx4+D
	 CFTiVrYA8YWzaetErrQ1dsq6FbeMLQiEZAzdBkjhK/lWB6M4fbSnGNnpLZgqRnRD2WmuH
	 nJY2FY5ZIS5aOCqbFGAVz1/MtvJ86qCFUZrvfs66VEIV8qTFPCyrD9VbRsCMHRTkrKmCZ
	 nEpr10Ou2ik94PuyU+4JwpkX1yZiKBqXBlvR448ASGwsXUbmHtETnmNFWLxCxcG9j/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="E6t9Ts/H";
	arc=none smtp.remote-ip=79.135.106.97
Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0D1606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 22:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C0D1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=E6t9Ts/H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795646093; x=1795905293;
	bh=0KVO+R8IkPB9qqtoJ3ePZ0ttG/txq7Z92Z+7D0sksZM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E6t9Ts/HABWhZ6XvlfY+6cN1T4NhrihzBxKmnckzgACQGUbcq4n/y4yllglJ6NmU+
	 z/7jmVKY6dZKKzRxEQfJ8OnhnaWlFoELbnGWmmQnmJGPLMn2elUa9ctOwSBOj+0AF9
	 dAmiY2GaZLqgCnTviVvJGZtxZCHU5VhX6RmJQuMEDBPUAQP2GHRE6sTTZD3LxlLNuA
	 OstYD8syU2paqfH1/ZxMb4T1ZIAOMSZleKOvGj2SCFfc/KiggW2hNn0XT4ZrUVzRt9
	 vOJkJaajNqujMnJShwdXgkR6I1I1jRzjNe7Glu9tj4ozNpQhfXhxwFwVkOeKpaluhQ
	 VrrWmb8fJTryw==
Date: Wed, 25 Nov 2026 22:34:49 +0000
To: Luka Gejak <luka.gejak@linux.dev>
From: Ahmet Zeren <niko3x@proton.me>
Cc: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT rtw-next 1/2] wifi: rtw88: use the rate, bandwidth and GI of injected frames
Message-ID: <ecNmU3PXiWoHo5Kp9n39tXmMq1iJCEzT2J_TrZH2xipIKP9jtEdDBIYUKdyBWvKCRLekdJgXgo50awp_oEjhE1KlfT6e1ELZT9abegQ85L0=@proton.me>
In-Reply-To: <8E47D781-B1FF-4B2F-B0EA-AABA130E2778@linux.dev>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me> <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me> <8E47D781-B1FF-4B2F-B0EA-AABA130E2778@linux.dev>
Feedback-ID: 201311995:user:proton
X-Pm-Message-ID: aceb0f170e767f4356eef8de303ad2fcf30a3395
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Luka,

Thanks for looking at it.

> Do we also need DATA_SC when the requested width is narrower than the
> channel?

You may be right, I'm not sure. rtw_set_channel_mac() writes
REG_DATA_SC on every channel change, with the 20 MHz primary and on an
80 MHz channel, the 40 MHz half that contains the primary; and the
normal rtw88 TX paths leave DATA_SC at zero. My guess is that the MAC
uses that register then, but I can't tell whether that still holds
with USE_RATE set without hardware.

If you can run that test (a 40 MHz frame on an 80 MHz channel, with the
primary channel in each half), that would settle it. If it goes out on
the wrong half I'll add DATA_SC to the descriptor.

Thanks,
Ahmet


Sent with Proton Mail secure email.
