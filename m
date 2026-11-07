Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039401;
	b=HJuEXr/pQ6LyaAz+AG9VKfHn2XNvoEMGo7TOGdHyydvqkjQ292+dOQsGBWxk17gzNxXR
	 WNnEJuT02o73TvKkravkYmslrbVxOPttmUesM/61+qt3qn68INzxljl4sy3ddCrHEr/7y
	 OypxRcChvNSDmmXFKRacvdfLSpLV4MWab9dxjxob2RNQG+pJe2GVOcW7GB47jMarf9EAK
	 ASCpFAsRqhBt+IzB8d0NwiOLAFrXsPEqrURYimM9k68ojzzryy5DGJWIseQbt7A9UfC1D
	 tCzVDNXWdctT4IjZYfL9a2HIDu0IG/zBn0C7NcYV7wy99LiyI6MlpdWDt+BRpWMAjcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vs9LuEmOJIRjKHitt6arG6kgt+6AcDLvJQuIwetBo3k=;
	b=y9EArR4l31xw2T6dKYrGsnt37AgwT0rZfPAcs9ukCIX6VXBKzFlzAcMbS1UvHS8lMDCL
	 Y0YhDQliaYXTfxsvAe+E2TdUZZFvKVR3KieOYTrfHFCnCGMJfsDJ5+GRLdVCYsdlXxUux
	 COagfaRp7nMKVrovULB9T9TXq6WsvPfwgnYQK/Xr5fRX2fVs5OlL5VJhLM0GmigbMCaB9
	 fds7t+F87M9fS26JxPY3Ouq58I9Ij32N74S1Ptm0lYntkuckwtrMk4CBszOk/vw8Qx6eb
	 fGoZAJcKEvrXAtjW/+vE1hUWdz1ytI3W4fi0FScbijrC9TuMmFW+B4khdkaizFselaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGajsjfa;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BBC606A32C
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BBC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGajsjfa
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so1962940c88.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039400; x=1794644200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vs9LuEmOJIRjKHitt6arG6kgt+6AcDLvJQuIwetBo3k=;
        b=HGajsjfaqJRkMwIvubMUNZvD4uHOHCAs0ojUWigKK+bnf8QzaMFqytw03FAGF580h2
         cQa9ZiieVKOqNBZgzo8oRTO9fxSoqHGeKBqTNrvNDJNdGcGakRUwDekiIBofzgCL2MCH
         n7TfWcUmjb3stuNaIvGZ+HvNbvMSwtg9sAvo8XjYV9ofY5sfdrw0PG4RBzvac/8NwrSs
         svqv9ZhcWtKSsR6LSeS/U0aAryEUOS/NDVgt5Gk1V5M4ohM/BbXquPcbL/PQWWEi+K6n
         ArFvuOglbrjj1CLjvMVCIol/Lb3xgjkPpn3czM8zMOSzq5hvMcFAsPHw2hqDda9yipoR
         /0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039400; x=1794644200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vs9LuEmOJIRjKHitt6arG6kgt+6AcDLvJQuIwetBo3k=;
        b=QOCK+duSSrSH0DKjd4bONYLXjMH1CYL83um/aLTnvExgBrB8AvMTmzk0RMko8csLQm
         0WtGvIIq4jbb+iNhOumU0t21WSrYZxA9EonsGt9waW9m/SdsCAPiGUYVqgb1iPv2vs6N
         wfQfJrPa612YTaYV2/MjuGilQHYDZ6NIQjFO+dxulbnHFCK0gt5o4MpcL79nq53Lt8Mo
         0ebqtArZC811mrGkeuoE/bDgY0jXMALtfO9PWqK12EP/g+MCPBXIMchec9j8GgMRvNcH
         3G+chmsHR7fqnsV1xLW4hted9UDkQJh0LZvI3hdLyPq/OKMSZ4ZVUjP4li9yyT40GfLf
         LvJg==
X-Forwarded-Encrypted: i=1; AKwUvBwRwFcaOID9rAClfmV6OqfgY5K15AVf627YZbEKYO191wsN3E9aWBgr8dntkUXVM8XalNJkK8fPIpslvjZLBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JHEDuAmyLdFo6zKEsTm2ICVnxpKBncMnBrSEFzDI0rdLQUOun
	1EqE5AEHyu06pDtQyNJwrdRi4vsI4d/IDF3m2YaBoUYZMgmIg4NQnHbF
X-Gm-Gg: AYBFou1G13S827CE9xCILxOctFam3pJBIZ7VidjBUmMhtTb3CB6c6/D/R61PU62mpq8
	DJLDv/Vkgar9DK7qJhKK+93lRO1S1hG3fy61J6Pb0VbfsMNi9o5aQvpOb0IHhTMvm/4W/ntDTua
	MO1KRDrFbceGW9o06IYWPo+K/uc6a+613MiV0tnpWMnj+K3YiAakeYxNy+QpWIdrGWHvJJXFIrM
	/xoRdiU/kP2TseM7UePlGUPKv8nDSCwEGZBGyHecUHjaSLiH6UJC8Hu+CQO+nhbEKZLA/cexDGQ
	3LaeHec4ookYqfs+dR1h+Yuj6FpcPF6/6G5m7aamUAV/M8tGN+Pzab2tX0jFd2V2UzV9BRIgizB
	tYFCMpQnE34Oi1yKf7sY0ucTIaH6lFQTuqLQc+WAp+4dOOKdcrqpMTUcPTw9pHFjQSg97RFBiG2
	uPTFm2gj1lZSTQNex+RSI/kzGElOx0OpiCW7d/zfla+G4qry5cjvry32aYxEyJfiI6zwCENtSY+
	AviEIpOZu9Taj0bo8wD3mGpNJtsks7CUR5NDAm4HszsGnxl2Fms3jF9F2pM0Z0mCymx6BG/jNcq
	TQTqHX5DlAxKObjHJx8DdztQdazZ1IvJfB3HqhU=
X-Received: by 2002:a05:701b:4346:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1b25d286bb0mr3789790c88.2.1794039399566;
        Sat, 07 Nov 2026 00:16:39 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c1df6sm12425640c88.14.2026.11.07.00.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:16:38 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: luka.gejak@linux.dev
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when failing to leave LPS state
Date: Sat,  7 Nov 2026 13:46:09 +0530
Message-ID: <20261107081609.97212-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d7e20cc5e8a0489b9b22f13a9fe8a1b423d2f8f1@linux.dev>
References: <d7e20cc5e8a0489b9b22f13a9fe8a1b423d2f8f1@linux.dev>
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

Hi Luka,

Thanks for the clarification and the tip regarding --in-reply-to!

> That is fine for the flag, but I think the counter should be reset in
> rtw_core_start(), like rtw89 does. A normal recovery never calls
> rtw_ops_stop(), so the counter would stay at the limit and the next
> single timeout would recover again.

Good point. Putting rtwdev->ps_hang_cnt = 0 in rtw_core_start() ensures it gets
cleared after both normal starts and hw restarts. I'll place it there.

> The RESTARTING gap predates your patch, since 5c831644e1f4 ("rtw88:
> handle and recover when firmware crash"), so that one could go on its
> own with a Fixes: tag.

Makes sense. I'll send that as a standalone fix with the Fixes: tag.

> For the counter, maybe it is cleaner to revert 2/2 (or rebase and drop
> it since it is currently the HEAD commit of rtw-next) and send a new
> patch, since it replaces that line anyway and keeps the current
> behavior out of the next pull. 1/2 is fine as it is. Ping-Ke, would
> that work for you, or do you prefer a follow up?

Either way works for me. If Ping-Ke prefers to drop 2/2 from rtw-next, I can
send the updated patch with the consecutive counter directly. Otherwise I can
send it as a follow-up on top.

Thanks,
Kalpesh
