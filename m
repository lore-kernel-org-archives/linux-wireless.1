Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905495;
	b=ifVGbwaqJh4gApyMvXGObzH5WNLwruN9C6Pz2imMhTCLb2+m7b8zgrRYcKS8n4ddyUL7
	 ae6O7qwwmbjsocPXNp/0stQxmAnkqMpMH+xMMTX6OuSh75+zyRZxQ1TrUVfiWshi7+AUR
	 BU3TDf0UG64iabZ583fFln0KI096mzaFOSwKXzCB9wj/Sk+V4wZrAkumVyHAqtO6hHCUS
	 fPr0eIb7CBPAgUF5BIrThpKOMIh6RSroHLHrin+7XV6ZrRgfYUsSTu48J3w2mP6613UVh
	 lbMmrvx0f4ysNlF8Z9zZFFF32s008yZsvz60WHke8KfWnhaEnxbf3gjWzghhKo4yCHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=OEz0oomxzwceKTZdD3ONuk5L7dJU/L1SCWIJ/2NpyuA=;
	b=meLYepF4Ib/WGEV0dxqm8L5JR+GSTVet+2iciFE/3uyFhqf1xMd3lnh1mSMOnDtM01vf
	 oaG40DhjVsshjY31nspSRfjYcMphIpOxXZov5tsr3lACEYF7EBgRjAa+w3p0EqEC4SI45
	 FWUw8QA5uNf8Gi//4tu4eNnH2qdGfjxp64GVdPZ2ZBikOIGjz3KOBNlDPDW7ou9TfTCfT
	 79aMCLFTBxhh9Ve5bH+icjKg90WsvUIekuCytKyfCwBFurZgX+4avXUIqRb0fQBLIRIRw
	 Qil4zR/1DHN5K13Q9yyn5Y03IjxnY+zfn1zi4c5ANcjNrcSnevHTLFybRd4QjWofMEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFJh47Si;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB5606A880
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 08:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDB5606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFJh47Si
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so2248822f8f.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 00:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794905493; x=1795510293; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OEz0oomxzwceKTZdD3ONuk5L7dJU/L1SCWIJ/2NpyuA=;
        b=hFJh47Si/41Pl/M7/F8cFN0r2zQyKmto8y+/1fnly/5pr+ZOIMjhtJLKJ6mznx4kNS
         SBz5T7wdL3mIixvy7QvONzlMh8KpGmrf+1jN8ktT+dPj1I7KeGtWQyNFEpvKZm8ygmAb
         ZqdEIxCgRNruKt87od5w7nA7BFTo74RCgbTuOWyTHEOqj2aal2xv2xI6EQtyyOOKJe2q
         0+ZSGZRlKpAijN4zRgtQqGy2s2yCzBzE/mjg5cwxDJZJkTokuX0+cR2wgN0Y21Cedd4M
         uEmYA83ziTg72tb7jOoa9zfSWM6jkcLCaie8FZVdTz9UX2xugMRoqTZs4ngzvUFQtFjh
         d8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905493; x=1795510293;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEz0oomxzwceKTZdD3ONuk5L7dJU/L1SCWIJ/2NpyuA=;
        b=aTwtm2co9Ri7M1UhObtrbvEXgW2jnIGHjydMULhArRS91deMReV9RK4Wr2vj9r3twV
         2yC19aQz7ag57hongNr0f3kLb4DTsPJtM/VeCjnJ3jurYogjxP3aKp5AY7OnQcYtpOKX
         6qTPaIx7kzrwUcl3Xat/kadinXAj6rtjF7zuz/A7Qufzu0Ac7y8k9dFRngAC8YEsx3Kx
         2jke9KB6KwGOxDYI661jIOIZv6oUpE8+AN1TfI8zZpGtpfE5NlrqSGGu01h27jKiCo5g
         mIbEguXzQ+YB09Sb5kFzYGSKX90P+1MGLs8PbOpiWs5VxaJAqqefEmR8CkqkS5qbKKpF
         Nmuw==
X-Forwarded-Encrypted: i=1; AL+hErGRofzybeVL78yDYxkd7SU2PxG+EIjQxexY9WkI7ngK8pV538vEGZL6AegISw0adqIR6CJPttElpJhWOm4cUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kuZe5KkBoF0XNcCiDQOMe+XWFOUosyyN5RVMzbDULFvmXMalp
	WjJqxbnf9lfg5+9pHc6LOpLc9oZM/uAXe7maU158G1+r+cw0FNM1b2FA
X-Gm-Gg: AZFdTZdJtZ3Scke2kvOjiFXncaANNjroOkTQoIk4PjfKjWyhuXHjdOR0hfA/3M3nAz8
	SPlQVPKEAa0a6kaZyOKBV/z6dsYN1fCDlDSHkmp6NEfP4woLFkQXTKCmd1QOiz8gezG4UwI35ZA
	ju4lL334T81bYOH0zrR3Jn/1d1B8mX8H1cNNZsAen4k1C0UKDWCOI7eqOL+SVmGVmMQRmxR+rGK
	4WWQ3oa0ZIaH5spxXGKi7ERu7XNEBDVrl223dXuRaX/thoqabg5ysQDzDUmVw4IgX/NAB0LeFai
	5H+lF7ZHyPolnF2aHyrG7UUJT+nLGQO8Zz8EeXpL/JMd/VmSQOGkG/ckYdcyEuJIQ4I/1nRhHHI
	qhsWhxaBNbsvjrr+GoQeOIxRp90hkkAlTujXMIazeQnOk/NU0gPYUzBjssiwGkRM3LbWY5BVKYq
	55LjtYvMuR3r7DAh6DT/gr5EXFeBnZ9GKikXrgbrElnnszOKSgJ29T7mK25aUcWM6gkYP3hmib6
	qkgD89YnhJBjhOm3xvdPBzW+uwb7wiL5/R2vGUEGc+rvaoX5jTPbHqtwFDkIdUF6QlNYjsHY80n
	Feh9meApweqkDRiGX0W+GpPcgN68Sq4o9bXwF3uVTHBSRdZv5K5n1Q1XdL7/hlZfQYtgHtJiHbq
	439FjUIO3r2chLFFWaWdKSyAzc0e7Sn8cjfCErWeqJrsADKo=
X-Received: by 2002:a05:6000:1886:b0:4a4:973c:352a with SMTP id ffacd0b85a97d-4a4973c3697mr1788407f8f.47.1794905493247;
        Tue, 17 Nov 2026 00:51:33 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm26881579f8f.9.2026.11.17.00.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:51:32 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 09:51:32 +0100
Message-Id: <DMXCW8192G9S.19BCMYODX8KSK@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Fernando Tapia" <fernan.tapia@fernandotapia.eu>,
 <ath11k@lists.infradead.org>
Cc: <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on
 the same pdev
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113120325.2913-1-fernan.tapia@fernandotapia.eu>
In-Reply-To: <20261113120325.2913-1-fernan.tapia@fernandotapia.eu>

On Fri Nov 13, 2026 at 1:03 PM CET, Fernando Tapia wrote:
> ath11k_peer_create() accepts an address that is already a peer on
> another vdev, assuming the station is moving to another band. That holds
> when the old vdev is on another pdev. When both vdevs are on the same
> pdev, for example two AP interfaces on one 2.4 GHz radio, a station that
> moves between the two BSSes is authenticated on the new one while hostapd
> still has it on the old one. The WMI_PEER_CREATE for the second vdev then
> makes the IPQ8074 firmware (WLAN.HK.2.9.0.1-02146) assert:
>
>   wal_peer_control.c:2904 Assertion is_graceful_to_handle failed
>
> followed by "failed to find peer ... after creation" on the host, and on
> AHB the whole SoC reboots. Tuya devices in pairing mode, which try both
> BSSes of a radio within a second, cause a reboot loop.
>
> Refuse the peer with -EBUSY while the address is still a peer on another
> vdev of the same pdev, without sending the command to the firmware. The
> station add fails as it already does after the assert, hostapd rejects
> that authentication, and the client succeeds on a retry once its old
> station is removed.
>
> Tested on a Xiaomi AX3600 (OpenWrt 25.12.5, kernel 6.12.94 with ath11k
> backported from 6.18.26) for 8 days. A smart plug moved between the two
> SSIDs of the 2.4 GHz radio in both directions, the sequence that had
> rebooted the router 8 times before: the new warning appears, the client
> connects on the retry about 4 s later, no firmware assert, no reboot.
>
> Assisted-by: LLM
> Signed-off-by: John Macias <dencity7@gmail.com>
> ---

Guys, I'm all for fixing bugs, but at some point you need to start reading
and searching the mailing list before pointing your LLM to any crashing
target. This is the third time someone posted a fix for this issue:

https://lore.kernel.org/linux-wireless/1316ed692b84f1d956e4854d9e974569a396=
1795.1784792420.git.repk@triplefau.lt/
https://lore.kernel.org/linux-wireless/20261001164139.370144-1-patricktlawl=
er@gmail.com/
