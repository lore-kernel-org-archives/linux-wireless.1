Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101040;
	b=L+HwTMN8vs9eLfO2BqZ7fZF9Lbm5vpYjmeYgLFY+ukDcwy2FMCjHWM9uPH6fBZtcefrM
	 AAHSO188nibKQOtzZEooENZOymdDX4yUrDJ4c7SWpO7Q0c+nz776kn6wMRgfenzisXWee
	 UzUvkIWlgxufdP9Xl/Xzg8YQQSu6ZN7512NQC1em4E6KBXSI/ZQlkag5fo8Mv71yXji0+
	 hkVw+LqC9G1lSJWPVVlsne3xD/1K0aCYxQgVnMFL9uS7pJGyAH0LJA+PsBZ7+3Dh8v898
	 FAOychiU7lsd593AR8swSx15WeYdDA11KaVfoFuU77ON2lLHFbZWu8LdOVttFK5CQ3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
	b=HXuZfv7wvvQnqhwwoGz1gzsXWhbZJSpPoxi9/g9VjBM+Ecj9U5gINGbu717D2bcNok2Z
	 1hAnVywgkiM1gpHgoK8Cxi4Ggp78739hN07Es081FNTMUwBLEuAhf19m+xohwY+JVAo3G
	 zroqRNz1hsPmjzk7WjLn1XafAq7pKb1WqfVdPV93sL0PEtXONScJlE2DT3ZMCPcCi4YUR
	 jfHe1jDEjh+XiVYt+C8f2yFKxKB5FohsVjgtq33ECdOrSrU4fwg4rQ51noGygWDY2hIBx
	 FKILbqUr5e73OatvWG8fFNLpFVQUGRSC1py2PPlD8XqXDMMNWF+zYeCIFCwpAkHr2dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umIq7Bh8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B2606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 15:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umIq7Bh8
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc81984fceso913275137.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 07:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101039; cv=none;
        d=google.com; s=arc-20260327;
        b=MXl+m/vjIgHsu5TWsbhXOXQv0U4KixnYxTcQCunA8RAFAoY6dY0lNJe7EucwvhHkm7
         8qg6NslvmAwDxPcfUOk56QAWgDc6hlLBXN4Q//CjQoTPUJxmry/B0Ib0rhZGN6Z/915C
         S2iY6Uo9dX+mhpJmq4+PHXII3xFVMGBNMN3KvyUTfdY0rfrjwm9kj1aMqGUKB+afiFed
         919rR6zBylHCK7nd5RVyQ9qcuEMgeWttVWYaJjzotC+rChgomCOmHsuYhqt9oRjEaWyQ
         y2LRrLm7sPHhrk9tJ5MpiKSXD5tUase4h4ENqSSAyj8/YionhZzDQnWhWzq6Mf1UiAgq
         6gNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        fh=is5OtJ+EzRVZ6R65yuz4HRnyuNKMXNMzxqkBbCbPNxc=;
        b=XN1lNu6WS+XXRS+zKsWxNZyq66fyHHFFSFL2gsUqs/lVxztguFGkG6dGG42KKhJ5KF
         6m8Iys5Yx7MHtyZFDCLdGH+JH8qco81ntFPBd7iAfgKg1WUJja1ZrzkvBKrp9ZoFO4TY
         571DfKZ8PCtJTqOE/XEVvysv1peF0XVOFYHOgU6WhfXwcmIIKvB4wqrbZ3fXisgjs48F
         XMyfH8JcjGoDEiFqz7XKwt+mKygh6Ujdjn52W7UzNuBVUB7EptcpsH/y1ye3UPUEeY0U
         j3HnPDNGJtw47aslnZ5x4dB/KBdTuK/ASbXmfDzE1ty2lHyNpTkYsu1mmN/OvVSIesaz
         d47A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795101039; x=1795705839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        b=umIq7Bh8QMl4L922VLIxJcaHAtAi3k3uslktqKyjp3SUD1RQ9uVZM/pMJ3cnHhJH4I
         N6eps+NicrDzupL2aT1v64Wl66U+PB3XBFn6qQmTfJmRFjquB7K7iTKcnAoAoC2EC3sR
         DcFv00QBmEDAFp/KAf+/N9Ep0p138lctHGZW6v7NNHKZ8ecz7GUteS6ANJXAW9MQxkgq
         okNDui8nDwu0atmo3CEROH4Nl9MMjFAdR2TeCWsF2SEV5tcxzcHiRHZemtgYtS5SuZlW
         vO8PRbH05pbNA32CXqgWe0AvDs5zxUXjMaRbM3whB4Bn4iy9GnbTWqj+9ZrvORaippBD
         cFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101039; x=1795705839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TAuAtF3fPWsY5c99NF7uBuDUPIOXdqRFu+JX8C/CdeA=;
        b=QzZOYHIWNJZL6N6ZbhbWts3HfugM/6CJkwlQNhSMHaujyj0mntXvtIhTydbzaBo4wL
         Fw/174QJm5QworIz+Wq73lH9ASzUJsR6MUkaAlK8ffByzxBekR9DDt5Uea1u46a0SosC
         soXNJFjSOlG7QEBKdskV04fRIBO9Gqo/XDYdIz48YRDgzWgWDogBDyYtrxfgc1qsM9AI
         8GDxwa2fKMX3iunCNzF4p0Z6Vxn4yLhlcRjP7R84vZATdULLKVQvID9o0cfE6lZyRLYA
         T79OYbNXYJUZEtb0oHSJ8xJpaXKgnLabKwa3ZSGjKLkANGSK/9HLxDOuXmD+yNYhcCzH
         Rb3w==
X-Forwarded-Encrypted: i=1; AL+hErG/bdL1u1Rw3eo6aDE9DaCbvbltN7ifb+6uLvTr0JXT910euhcBIXEoFpASkjU1eVrR8J/SZjWsoMaRA/Nj5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+nEn6UUSpemXPt+O8bKwcs3ZLt2ZN7glP4+eiiJL7a/rAY0qbD
	cuLDZjFgE17aVNsmWBOdl+zF72hnjSTli3h1IM6FcSaC+rY8UqnDLdXpTEqOYHQNb1CuN9YFqRc
	wvEi/vs2ojwMGlJDirQGMCWpkeGO+Erg=
X-Gm-Gg: AYBFou1k/khSw5uV/Gcag/S7obnMW1aY8Q0B2wzfbgN4cPOKmdIIqZeOic/bHzLY/jZ
	rHg7wqdzDc4DkexS3ufSfJ8Qsljn+CdYLVM5q1rnHbhN7Z402MglZ/PiP7ZLex76/JgL+wY2haV
	7iSrcD5Z6xnKqQyeD4/HJv3ZUZh1j0id7ZH4W23Q1FFKanohxSKl8VHP5hAIvuFFJgM8EDFIm6Q
	4HRv38IjNvDyqPlclIN38+ri1NFTc66+OlmJTI9ahATXncqO4k/2OjNPBRTNW5Lo/WH2GS6d4AS
	p+IBrs/jbHFjVvVJHHrrgLQWn3k7uxHhW4Q9QPruwKue+Z6IWhRW7fSNOgcodT87tKy4lehJij+
	UhsABkDz5KAOUGqyN4sYxfK6/Ociq2lTGcBVC0mwcm1iDEFjXmbo2xz6c0G6jbKpnRr5F153epQ
	wAVQ==
X-Received: by 2002:a05:6102:548e:b0:7d2:840b:b064 with SMTP id
 ada2fe7eead31-7d6ba18e430mr2284058137.3.1795101039217; Thu, 19 Nov 2026
 07:10:39 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
 <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
 <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
 <CAKobHXCMwjAHJOkibPbpDByLZmAKkszZ3WaG6soSDaCEGRQjgA@mail.gmail.com> <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
In-Reply-To: <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Thu, 19 Nov 2026 09:10:25 -0600
X-Gm-Features: Aa3M54pZaHP6ysBEqmdFQebPmeAF0kkje7A47NLqpnzWPq0PTLeUQa2a-UgopI4
Message-ID: <CAKobHXCUawNNtyLn-n9-qXV3F_q9drWXeG28bY5ARiiTLzXO2Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: loic.poulain@oss.qualcomm.com, jjohnson@kernel.org, kvalo@kernel.org, 
	quic_haric@quicinc.com, quic_vnaralas@quicinc.com, quic_pradeepc@quicinc.com, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, quic_mkenna@quicinc.com, john@phrozen.org, 
	ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On 11/5/2026 5:47 PM, Jeff Johnson wrote:
> Please don't send HTML e-mail.
>
> Note your reply was not archived or sent to the mailing list because it was
> HTML. I only received it since I was directly addressed.

Sorry, Jeff, and sorry for the duplicate: my last resend went out as
HTML again. Plain text this time so it lands on the list.

On Thu, Nov 5, 2026 at 9:53 PM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
> It looks more like a theoretical issue than something that is likely
> to occur in practice, but the fix looks good to me.
>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks for the review, Loic.

We did hit it on ath11k, and it did damage: on a QCN9074, a firmware
crash failed a scan start with -110, the timeout was armed anyway, and
it fired after the dead radio had been unbound, ending in "cannot queue
ath11k_scan_timeout_work on wq" with a garbage workqueue, and a panic
(that is patch 2/3).

Whether ath10k ever hits it I don't know, but the code is the same, so
the fix can't hurt.

Christopher Griffin
