Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352379;
	b=GKc64mLWZv2mC1wxlBR6vRLgwgS0OQay2Nrtn9Iw0uff56n1lbNhagFrNYrwFuZiGRyp
	 lZcxaZzE1LdyH4tTrRjWAvc/miEPKN5GHqrxr1H4+zhIu5tKT6rrD/8VIRz9jzYtz2tlm
	 optRPMCmQVsKGPgZFfuKb4z0qrMKhsojc7dG3ChGjprNpvvX4z5X4u+xZXS5HeNTOB1Ev
	 gNbP/48GGd94ci0xkkpactT6bptGcZgSe0jremZcEkJ/Qxeblb0Uj9klYiUtp3CVz/lgT
	 4zKMTY/8ib3VjJAMo1wzlSPCO1Gk9gwwogKWvzFo3EMQ9P4zIB4JgU2ItGGSq0bwMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
	b=jBkSuiANLBIMPMqw/xNIgO+pcm9NR7vNnjG7QUhsy1zZkH99reOBRSDeu87bHhz09/DP
	 QNF1yqyYNjTBvZbhxlfDfppmQIPizJBXSIgqWCLd7TEmcKKEky2Ww53osHGys7Dmjva9L
	 yMtQ56OS74xSHEY7+DmrqK75fFQuFzZBWHqBt4DwOeNwLUkQoQalmxe4sqOop3F76vT9a
	 ePlmAm5TA3jTfPUcOy0mh0O8ARIn1ThUmlLt90vs3YZo3RalJsMvAxssmsIm7DR8SFaLL
	 OblUSJlnB4SAFfucIcH60hrHZR0lrPT1flfuPscmAaIsNGM0x9BTvAEyhS0cdljZiDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSjfrMQ6;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC1606A320
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 23:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DC1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSjfrMQ6
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so2900406a12.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 15:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794352377; x=1794957177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
        b=WSjfrMQ6WZyK/eFatX8b2LNTKZ/XnuxzCh510KuaKVgVgCQn9g9qyj1sJLNK0/RhVv
         7rg9SrKUW3ppElEMW5aDhwR4gzK26wdIpWLzdwAPNx+uNEzX2dn/R/Do4QuHQMpNLnlv
         WWe5nwsK2pz1CZGwC+MZIfomaJ7MNQ1toqS5J1Lx3GrZ8wjNbQm5/sDD1yBjDb1Sz5vx
         8coLj1xbD3T4wOlr9v0QIEF5XtmkY/gaSDsQbWEzi6MUHzeTMgUlsHwc+GQKoag3VaOp
         qBk4jYQ1e2Ap1H2WVEQk3N63dp4pvuYYneOj8c+IlJeZOerqzNVu1vtjC7SVdqqKph10
         X8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352377; x=1794957177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
        b=on8lotGIo0gX8jYtlckBm7tWsFGC7oV9Z0YmwBrIBAWL8vlABKTWjZQ2jz5jVlQsy8
         UuZYhkKO/YUTLoAdfm2nxb+bLTJY3+7H6LQZ2rk6aLfgDiXbooBFVgSM40ZmRYgpjQCo
         jYo8wdeK8cuC+cQPT5KOs1C0g+dMGcrUD/ErOlKlbZhWm8RW2gbBYNOUP7+ehV+DerDo
         XwFjXW3E+fxPZWYbOIp74dGw1NYKAEH/v3HZQUEsEycMV48lSlmAP8Aj++ZmwQ73WgTZ
         vkaGAgzhQmqRcsdnprI9gAUfPPaTK/aYusWoSx/8V5YlQ8j/yGWskeMMMu3Yw1tttJKr
         olhA==
X-Forwarded-Encrypted: i=1; AL+hErGbA1Oc0bRhlG81B1U3ZNRAdEphnLBaFEgRjbXf7wPsnlcma5ZiTcyRAHXlGq9RWaQfYoMd/JchH4P/qVQ3CQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/x8UCieOg58+1HR6QPMyVHb15fnzNpVCRFVpd0w9v5/ebDT1U
	+Q2wO4+oZoP/92k1IHPPWMi3+M8mZ3YrC4unmJW5CxqANv03djKDN3e+
X-Gm-Gg: AYBFou2gzphdfTBPCoJy9BBhdruOn1G2/VmX5Vg/OXRZWv+fC8MRM2DQ3ql/Sxse4jG
	FoyCYRlOFtEBxCQuXujq6La9p5ctith/hiqFHSlAIw4auq8IhJUDu4en7dcfOl98Wfxm+1wwkWr
	7UG9H9SDMZeVcfO0RWXOxcu7PAfpEvkSS+bNA5I8srpav9SxJ0EKegaIONULkPwmUxW8TkmgEah
	oJKK8Ut71xbpGKoi7rJNMRB++jJMwmOmnyT3dOo4mg+dyfVOKMBNMmqCj+x2S99Ika4i0S6Fgu/
	Hir394dEcGBZzqouGsxyQDBvtXGYTk+Ut0EUG/r73P4U1MJoqa/f6A5Z/orAbTQsGRQmM9QQNdT
	RaVRIoBIieMHfLdmbZZIynBWZpkNicdze6Lf/rs9EjWAJPIqqf5aT3ZISGAHNcaV4pcAwgl8Y3J
	CAV0RQdGYao8qP7vRjFzOxoazNLo6xrNByM2IErLKV1ir4WqjwyZmLYfZ4vY5iPQAUvzlv3BcYp
	+LbqSICjW4Oi2z7ueZ6o18gtmJ+JXz2gYV/bjhLZ7Z4dJT9RnSCGhwFtow5ehwSall0Sdc7qBJB
	LKsERiF7/mams308GIUqlLLbm2SSoQo+uyIseNeVBMjoIZl5s7Rqd2s=
X-Received: by 2002:a05:6402:4506:b0:6b5:7886:c450 with SMTP id 4fb4d7f45d1cf-6b77781b377mr528054a12.40.1794352376981;
        Tue, 10 Nov 2026 15:12:56 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790353asm1750018a12.31.2026.11.10.15.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:12:56 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 4/4] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Wed, 11 Nov 2026 00:12:47 +0100
Message-ID: <20261110231248.206892-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154810.89780-5-dev@deq.rocks>
References: <20261107154810.89780-5-dev@deq.rocks>
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

On Sat, Nov 07, 2026 at 15:48 UTC, Andre Eikmeyer wrote:
> The BCM4377 firmware returns the tx status of queued packets only when
> it gets the flowring delete request.

The same happens on a BCM43684 (firmware 17.10.188.75, an access point
with about 15 clients on two radios; this chip also needs patches for
its BCA firmware that I haven't posted yet). In 10.5 hours the wait
timed out 23 times. 2835 frames were still out when their flowring was
deleted, and every one of them was completed later, at most 81 s after
it was posted. No pktid was lost, so the 100 ms wait did not help here
either.

What I can't tell from these numbers is whether a tx status can still
come after the delete response. If it can, it lands on a new ring that
got the same flowid in the meantime and decrements its outstanding_tx,
which also drives brcmf_msgbuf_schedule_txdata(). Do you know how the
firmware orders them? In my tree each tx pktid keeps the generation of
its flowring for that case; I can send it on top of your patch if it
turns out to be needed.

Kordian
