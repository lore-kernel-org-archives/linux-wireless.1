Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750097;
	b=ea0x5p1jMYS6/GJUHo10b3RbR/T5aHcj+F8NVOMg13CQks957JI6IIQIxiMApQFry3sC
	 Bptx+lBseM68OomIMdovj7m4XDTHJIEdppLLnz4CKrJ4kV4P99NHVz4f8NBedJXwz50eQ
	 doJWWsAO4CPEs4/Vh+cUoVctCWkhroEgoHA0N77Qv+tAnCQ6x/g0zNO4QdK7+kZwpc1Wv
	 4Yr0AAcnrVv1P1PBq2sk2x4QBu9XPJoiwU43F8YfBLXSL/LsKj1H2kFM/ZYDUWrv2b51k
	 VcXd+Fe66itIzioWmWQBsRpJ6WNJXAfNqFQyk1iw2VRVM1jHRNAhpWbw+Whtk7V5sFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750097;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=z4W5MyncCJpDGD8k6JTI3yX6S2NHlxMNz+A4FQlhDHM=;
	b=TS6EF3ZsEaGN2X02L0oOB+D61fYvdDv4sTZyOELilpb4/chH31xZnPsDendrydxnJ6kH
	 3tvbWcK6a8RHAbpQuP6g3QJJlQJG3l/+4l0MRXG4gYtqIKY702uTRMtzolxoaTjygp74O
	 qCHHanaQWRlFYnzB7tMirl+L0v2jxwSKzv/h5d1gxZiflYOPjzrFWDmgLw8hOST1r1mP1
	 qHqjhiz3yQq6lfgs8Y8sIEv+64XQ3dczJOi91hA0CI/0EM3XEETE/1V48x3Ei/aGqltm4
	 jT+34kMOC4vQ3Z4uF2szSD4VGdEYC1fTnDs3zQxiJFgJlluNfMvzPOx/bRHskocc+NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BQIU8O7M;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A047606A329
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A047606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BQIU8O7M
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z4W5MyncCJpDGD8k6JTI3yX6S2NHlxMNz+A4FQlhDHM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794750095; v=1; x=1795354895;
 b=BQIU8O7MDTno4HkVNgA7hWI4PyqqWwCoFrXE1mGFWnPkzZou2V8lT4aZYQgijeL8txZm4iVk
 1JerpBARXGsL5MM4KtQNrPRrg1eJs6MgliWs+e6JvW/1+nf0H+58czvaZCxwM8ujPFm50HRtIR3
 r0Wb1OAOXyhl1HXw9hx4EWSo=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 46ae41dc8a0f5cf2;
	Sun, 15 Nov 2026 13:41:35 +0000
X-Mizu-Trace-ID: 46ae41dc8a0f5cf2
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:41:33 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_5/7=5D_wifi=3A_rtw88=3A_prep?=
 =?US-ASCII?Q?are_frequency-offset_correction_for_more_chips?=
In-Reply-To: <20261115114336.1739863-6-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-6-hjf3108@gmail.com>
Message-ID: <861989FF-EFFD-4890-B369-FB65F6E4DB92@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Jie Feng,

Thanks for the patch. One small suggestion below.

On November 15, 2026 12:43:31 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> Promote chip specific functions into the common core for cfo tracking.
> These become helpers which can be used by the other drivers.

Could you name RTL8822C as the source of these helpers and mention that
the crystal register writes stay in the chip code? I think that would
make the split between the common tracking logic and the hardware
specific part clearer.

Best regards,
Luka Gejak
