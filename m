Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794817369;
	b=lOzIaj5hJDeb+ooP/CN1/P3pekPa8MctTy3d46PKkUfb2/DcQToi45nGVQrg6kgKWWTY
	 SjbI/2knZTPqURxR0hNAL2BUFJt7+ZGx44JMCbxyq5i0Xem2iM2k8+kwKUW0NKZjb+C+G
	 eDZF7sNywbfKzdoD/zcsSWBpPeUnOaLAVp3X4xg+Izb8errcWhvpfDOiKe2MOd+43g3PE
	 gokLhqHI7h/W60d2yT6cwqiHFAjer3DZ4xyF4v0RpZzledDVD6a6Eo/bt64pkUNPuUKZ5
	 Nfdg7QIlRNuDdsm0jEgCsrADLG+Ydhmm9P2RVnVyNsBJp9uSo5cOaL83PFUfSwRNvMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=SYFU2QBv5xDxK/7I/qrMcNuJjyq4OfiTXqnL0We+pKc=;
	b=SW0JUMt+AMeLVEmoQYKPL86dHtCp/qPY2uKSGWFCzutEYH1ijvBubYTekC51WC8MrTSQ
	 FKP4h9Ack1OuFFNklXoeK5HJANBzq30USWRMwEXdMFUeKKEGfo4xgV0C3KLwbu+6puhW5
	 sGpYgdBvChQC+YdhRiuXe8Vwxz+GYfbQ6QXpWYA6ZWpjWpNlmwcbIa1FhXNMOY6Zw/qkZ
	 mG7SfZFsjMm/AjWPZ+GK43SB/5qGjss2nUCX9g4DShgg6lwbhUk9dvIMPrwBFx88SZ5EU
	 oQscNl6+FASrmkJidR8lgXNpe7iowyoaJdq4XrpQlZVOTsDzibUWgt5cMeoTnWH/rOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=acio.nl;
	spf=none smtp.mailfrom=acio.nl;
	dkim=pass header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QRjTXZ54;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B0606A32A
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 08:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528B0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=acio.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=acio.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acio-nl.20260707.gappssmtp.com header.i=@acio-nl.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QRjTXZ54
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so121194966b.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 00:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794817367; cv=none;
        d=google.com; s=arc-20260327;
        b=S+TyPmNr0SuFTvqkPfzKvBUEEb6i6pKbxb8q7skL1pOgCoviU10g37menNtrUvdgc0
         9sPz7CYXB5NOEZvGkcmU8KAZ/ItiCPA9ZrLx0p5nj6nrk0+vOcRC7Nclfv3103lp6g4P
         QcpNUM0wT/LK01FjeUT5o0gk9GU+o0y6BaIu+Z53lO83+F6yo8FoTdzFKE25SjgY+Gc1
         paWHp0SGTBRs9fmdBcp5vpDkzKx5WxjgCPr6OzLXnVg8eIXT7BlTsdSgsI7Ho/3DP5YZ
         ANqUwx4gJRcaRNVqKggtky0+j6a6379f9GYllPZUSepis+/3MrQxaHuiPOEw5XbpHcSj
         JOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SYFU2QBv5xDxK/7I/qrMcNuJjyq4OfiTXqnL0We+pKc=;
        fh=zFCB9yj6tbPtiNOgT9n/qK9LnQKfgtX1AWhCxXtoerY=;
        b=NSGTlECxkTS2+qwrOuIV5l4IkUJUrw8M+lp8cHsdpn3X6cqGjk+nCjome49vBwxDtp
         Hc7j4omoiUvWEE3Ga608wiVCE1O+xBh8oZ3ZR9dxTjj4F4r0zIPpj0EUE921JcjsH8yq
         6kLKRVSzeVaFhAV52HIh637SjnxtXiRB5WFq806A2RdeLgNI7hsqtw5q1h62GYPWb5L8
         UhBMv7PT9/DGWxnx+BGGnN4uJGROzV3OtQmdGNf7vv0lErCKVM20+IEA3xd1uXGhohPq
         fAoP+EvdfWXPIcu3UOS/EwNeBUkGk3m4eM+dM4x3oyULagmrppm50V1AQKyWFgfX5vTo
         1v7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=acio-nl.20260707.gappssmtp.com; s=20260707; t=1794817367; x=1795422167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SYFU2QBv5xDxK/7I/qrMcNuJjyq4OfiTXqnL0We+pKc=;
        b=QRjTXZ54fLPrSP4UBLTSWg+BZZDzJtUj3Uo+JgUvPGkKLbfaNSMztkXR7yD/gFhzBn
         VM2qonhDG2DASE1FIZCdtF8sQL1xWjPqQxJLw29/AgqOOpwZt5wzLmDu931qXK/a99Sn
         Yr3hUse6wxwRmwVP9F6kSskSyeS7lNCtrFNEs7X2UD8QvwgbtCxWakPQp63GagouoAAg
         UYAYHSKyuSwyQi8rEGIn+zXFytEm+yNwATI1sXIHgscDDCRkw9QWm/XqYsUCypK3k4vy
         Tz2aqpc1XkV5tLwY68Cw2HJ8v1yT0Z3MuZeg1FbMDglNk7w3kNSABA/eml3pdNYG7P3v
         WaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794817367; x=1795422167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYFU2QBv5xDxK/7I/qrMcNuJjyq4OfiTXqnL0We+pKc=;
        b=HuOShxx+S24UreiR+Q1jVe8zvmB5L+A62KyGBacexstmNbhBLRg0XS1ni9v9XyjrlQ
         Te4yLLje3YLci920wbYGPBgXJpm7RZecgUtHVQzfsxxHEx67YpWVuImAfU1rknjb2rf5
         jBros0H30aW3fwpf1mO0wTaQbvBTSHnS1kKwzonjA9wMw8FvqB27pCxXIEL+WhCbLH0L
         BOpsaFJ0GVqj+8nnMZAFVcjrwyhyUO9GMukKvW9IU+D92JtWSPaG9WcWqqBuLDuThXs4
         9kDIoRlk9oY+/SYOkXp6i8jaEXrULEuLQGW3qhttiiJw7LHPyrb4TzFNbK74r1lqtOF+
         BA+w==
X-Gm-Message-State: APuU4Z8ljNjhichFk0b/JMLu1AMBRDx0niSqcWCDaJv8B1hNsJqxN3cM
	no55pim5jbqs/1j0m2D0RBifCC7p2stKslg9Qj/ULlamB442r3DKR2+R9PcSfMMKHqwAda786sH
	JYfjMOexZi6eYNjIht/jXmbHCqoXqGElWMERgAQV8cxtJd72Cwa34l8fZ
X-Gm-Gg: AYBFou2JCvCHfUci+vSeA97AS0hczOuEgkPy7W656wU7+Gz1P1Dqh6mc3/gV64d6ZlM
	3/XJG+/AMz0Xhn4S5TQXrB3G/SwYPQnnW0GRPlP2D1/KlO4B4zuJGHUZDAVrxkRNgoE01L62FyE
	So9ZcZZZGYfOqayVvdApDL2Made22JrNEDR+9tTFDrA4C5TOBOp+0y2aaJ0WYe7KQgH8x25URcT
	uEB7bhyDiTypoMWhMbHXwlbxnBi8MDpU7d3kDEk29RkdHKqEGbbgeMn4iolt3TxOwRJbllVHkhe
	1tAddXhyUmMHLJW8R2kkehW+n6yBoijig5wNEMbe+Ytq9lCqwTGq4wAEP1I2w4m3dCW5qu6fmQw
	OM89xj3DeVtymXgrKTr5UqAuj8YDNrceEaTk0Bnzy
X-Received: by 2002:a17:907:6d20:b0:c3e:d0ca:d30a with SMTP id
 a640c23a62f3a-c50963163d1mr799864466b.4.1794817366680; Mon, 16 Nov 2026
 00:22:46 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113080731.30155-1-spam@acio.nl> <4985719de8b5439e8484384ed52033e1@realtek.com>
 <CAJKtVVYmwL3FOC473sQ4BMPjmhep-ERiu=YtmpOQ+24qXB-VMA@mail.gmail.com>
 <6c3b2f153e884047b6fd44da9a12f8cd@realtek.com> <CAJKtVVa6n++Uhy7z58d-Wbb3oGnTHz+bHt07_Akp7FPn6F2qYA@mail.gmail.com>
 <a0448c760a5243a7b956b16e9d563183@realtek.com> <1df4e66bece7402fbd92bb6dddb7ed1f@realtek.com>
In-Reply-To: <1df4e66bece7402fbd92bb6dddb7ed1f@realtek.com>
From: "V. S." <spam@acio.nl>
Date: Mon, 16 Nov 2026 09:22:35 +0100
X-Gm-Features: AclHuK8tbl5a8k61Yw28u_ga4revrs57q_Aash7YYYMKlzjut9AhxfZ0UG5aV94
Message-ID: <CAJKtVVadib4LqBpgcOGFiU=1B4w88mrhmXq3Go_-sr-6DXiNaA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3] wifi: rtw89: set RA init rate level when the
 station RSSI is known
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

V. S. <spam@acio.nl> wrote:
> Ping-Ke Shih <pkshih@realtek.com> wrote:
> > V. S. <spam@acio.nl> wrote:
> > > Ping-Ke Shih <pkshih@realtek.com> wrote:
> > > > How about memset(ra, 0, offsetof(typeof(*ra), rssi_unknown)) ?

I submitted V4 as discussed;

https://lore.kernel.org/linux-wireless/20261116081741.51039-1-spam@acio.nl/=
T/#u

should contain everything we discussed.

regards,
Vincent Schurink

On Mon, Nov 16, 2026 at 8:49=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Ping-Ke Shih <pkshih@realtek.com> wrote:
> > V. S. <spam@acio.nl> wrote:
> > > Ping-Ke Shih <pkshih@realtek.com> wrote:
> > > > How about memset(ra, 0, offsetof(typeof(*ra), rssi_unknown)) ?
>
> FYI.
>
> People are working on patchset to remove the 'typeof' [1]. An example
> like this:
>
> -       if (len < offsetof(typeof(*mgmt), u.beacon.variable))
> +       if (len < struct_offset(mgmt, u.beacon.variable))
>
> I can migrate to the style afterward. We can still continue this patch.
>
> [1] https://lore.kernel.org/linux-wireless/20261113-offsetof-v3-2-714df70=
53893@arm.com/
>
>
