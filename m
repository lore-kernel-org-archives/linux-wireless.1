Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709702;
	b=4lxcDJd8f74cCpld6olMtFtKjLx4splgLTQR9aTGlRqy0uO7+bruDII51yGbYojQyZWM
	 b912DddISw/2OZJmsSJzczPr9fasmrtUaqNio56dr8fh/FL/rEPmbDmqBMDzaj1+s98L5
	 ZUgqF7oKC4b0wvekUugAj4x8xWnkqrWnibS3dTO+hInngWDA+DI/6DtU/HIBNHXEHQw5h
	 1zwKbkRO952YW07QbXO/W5OXQhfq3CjsftobE8bcmhJzpLvs++byog4U/5gSL6ihDUo6H
	 Cn07hxgR/KV41h8ObuE4IdBeRpSl7lSiqcZlLrs6ykKNFjaAiYsoO9PesntrHMUaILw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709702;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
	b=bvNP49Re7VCKhKgf1ZsaQNRvvcnhrRI60MGkmVOxhXUDvH+X5F5ugBE8+kX+jVEuG4kg
	 24wCLTYczXLjAjxd4nOTquRX563vUe8+QO4nhUUMw69yD4RRaa3HCsOSBQpdIGCBvvTO4
	 g1afa5n4ggd3s4EA1mgqvPkgB6RN1MEgO36QO4txTgXlfpB3EiuGiCTWqJ5Cpz+hCVCYV
	 /ZxYm4Zwmr6jXEaOjBPwcFC70puO4XTkFtC/J6m1T/tVoYCKHcizpaWnNxqn9F/II83MN
	 ycsQQdejum22QgagTwTlAnpIwbhE0eTz860RYuQiNHXLAaatbWsDula1jJ5J6h+SxnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K04GlxYw;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4C606A68D
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C4C606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K04GlxYw
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso3060028a91.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709699; x=1796314499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
        b=yU+4PzaZXW5X3+9GWr9hExadwsVJz+z6iwmj6yc6RRPEt236JGMKaOG/BRYOGyA33H
         FxJqXXZqPwN9ygf3qz287hcck55GPtQAXjKninNiLC9AXpyfTLJVYhISGL7CJ0OUltUh
         iZUDmHPJU3/fMSCx6TW9Vn5u5581Z/X+O5KjkhWfHhEFMZRcFzM7d8CvcECjeHrZhahE
         amREXauhLbPa3uLVnmEpXyrSrwVMg2lnAxytfqkaYqoTqddx1NrxfbzycCgGb36LfbKf
         xTGgO6ydl9Hng98oOTSewSKga3VP7ZGRx0X8+etw48aObvdDKIfae+4vQawE9RIRKGRk
         CyZQ==
X-Forwarded-Encrypted: i=1; AL+hErF983kW7JUzzT6i1GvyD5bLwFUBQME2JX51d9uadgtBRpgeHQdWUMVpLhDurA5frn8ILsLTPFTTK5pe5vHdyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ybSLOF2XPHtGm+6MkRgHEQP0vjbH6HWWEv4fK3+mNxrbJQjN5
	bwP9b/Sub97cJ6f7ujPrum+1njIIn9GZ+lonEsOQrgpP4kL//3/PU0ZaJj96RYCa1tY/nhN4D80
	UMXya0+04IHlLapDro+di91U/x5pZMgOYqUC58880GGA2y24RymiTjbnzKcksGOUeKJwb/Fo6Qb
	hup1pRBF1bo0/eeMy2FQ2yLrM6ww/7VG8eNynuoM2GtDg3F/MZ4hwAs29qnzbjd4iK+It5ZBAqp
	YdHMkXvB63nysnE976iSY88fQ==
X-Gm-Gg: AZFdTZcs4n4+1JaITsVOF45zeDA5+IUM6ERlY80JKHBOpeKFXHDRPEpXz91FhkJgrWW
	occ76iUuBp6fblhl38tJoGE4qFCIfE1Rcj4GXKNLoqowfTBolPnGnC9TcN3oD0+PosOjgOQtiJm
	gX69b6jLbO46DpljILeoDIesFMrPhqg+MYd0tSVZtwa8NWtmkRJQmZ6KP0dK8QFQ/vMS6PLsskX
	LcFrsh7R+5hRJZBKOHwTN4dcurNNLUHL8U8uKc8Kb1310l0h8P9ietsbujOfhRdpY1503fB6HBS
	MX0Bgh0A3ZUB8FvNn7whn7nRxb9uTjRN1Du708WO0bgg4pGfdzFgr1hIEAEvLvq5lW1MJAnWizJ
	uisNHBGzvaygnvUzxGdJH+hRZiAdEkJF4qvGvHtrEE/myM1hdlmte08PSSbXILFrKKuVbwLY0mD
	+rpp4l/0tSnqAaovtH20kEKwkt4Wk14lEFPKFUNKoywg==
X-Received: by 2002:a17:90b:53ce:b0:3b4:6097:8e86 with SMTP id 98e67ed59e1d1-3b46097927emr15478292a91.44.1795709699059;
        Thu, 26 Nov 2026 08:14:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23b49fsm6523233a91.1.2026.11.26.08.14.58
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3969a2a7so1016441085a.2
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709697; x=1796314497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6EEcBx54YLs0UycGj9fOogpcYOKLpuI2YvcB3YnY9M=;
        b=K04GlxYwKnqfDFqNa3CFtzIe0lo4570IqVtjPk23pAFcf6BkkmZ0YkJ1KBAKY3WEz/
         +KFRqVemt9hKuSQB/ae/xoJi7uW7zFBBwzt6RpluThM3JyHyrfB5H0Xqx5Co4tPZpcgf
         M6jmV5KCvb4QQGUMqOv1sS+cYpFhHIJ2Q2PF4=
X-Forwarded-Encrypted: i=1; AL+hErFSE9eaoIkNSC7B1HxIia4uQcvery0RNy04zL1wwazaIQXPezYe/S5MlMrXIpagD4yUte+q+I8efxaeC9PBlA==@vger.kernel.org
X-Received: by 2002:a05:620a:8389:b0:942:a42a:78a2 with SMTP id af79cd13be357-949ba9ffe27mr3853464385a.31.1795709697563;
        Thu, 26 Nov 2026 08:14:57 -0800 (PST)
X-Received: by 2002:a05:620a:8389:b0:942:a42a:78a2 with SMTP id af79cd13be357-949ba9ffe27mr3853459385a.31.1795709697120;
        Thu, 26 Nov 2026 08:14:57 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:56 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 4/6] wifi: brcmfmac: add the AWDL data path
Date: Thu, 26 Nov 2026 17:14:43 +0100
Message-ID: <20261126161444.2484980-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-5-dev@deq.rocks>
References: <20261125190254.176055-5-dev@deq.rocks>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 25 Nov 2026 20:02:52 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The firmware passes AWDL data frames as 802.3 frames. An LLC/SNAP
> header with the Apple OUI (aa aa 03 00 17 f2 08 00) is followed by the
> AWDL data header 03 04, a 16 bit sequence number, two reserved bytes
> and the ethertype.
>
> Let the AWDL network device send and receive plain Ethernet frames.
> brcmf_netdev_start_xmit() adds the headers and brcmf_netif_rx() removes
> them, so both count Ethernet frames. The addresses of received frames
> are moved so that they form an Ethernet header with the ethertype
> again, which keeps packet taps consistent.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 87 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  9 ++
>  .../broadcom/brcm80211/brcmfmac/core.c        | 17 ++++
>  3 files changed, 113 insertions(+)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
