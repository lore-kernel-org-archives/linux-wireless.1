Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295878;
	b=d2CIGN0IvQVA3aznHSbuKoa4C9gU44mUxU2oVko7kGgVZhcF+WWLl6t6ya/8vccu50pl
	 P+qP7V+SAKBMaUrZXW+34dBl6Nqahl/TBtgGY5Zj66yhqfSYyNlTOSqI6+GJgRXUfpTHO
	 qZHVx+1Z+lrrL3PGGtyRqjQYUketbq0Ie0jacW+Aj6TNtPUkk5INgQ121bguRy2fOZkF5
	 IoOT5ESD+ye5iJr/1TbVEtzhtkg7zzdXv3KLp/xOvwNpELFhByPrwBE+pfDcDOdBYABUr
	 iH+c8tfnbvrFs79vaBmZXVXPlRk29JURQOCtrhC0sEnTKwtzMqHhoGGgqw7PtBP35kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295878;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kZOrHoSAnT5UgnO8k0w22Mr5IvkNGKHdmxoMOe658bw=;
	b=ZHACIVNdY7Q+iCGm23ig6GWIfm+B5BAH9k+K9z/szyGnuC/NgSE7D3DweiTIalcAjIdU
	 mk9fjNoQjJGLHhN2QEWs3/aOtZep7z6y6oYq41tOflWZzgzPpYXdzwVUBz9aDC9kl8DBG
	 hXoaHq9pWj9YHo2kBm+dVZh7+HPhIU10wsnGYPcc1jj/mw3+8lDpqZsOnQSeQN+y6WpiM
	 ZQnPE/z5jD95xYb7X7YFenXGCAhi+Svn1cId3hlP/PRYuBOLCVZWpQzcRO4wk3a+VOeeZ
	 e8l8QVSp/z/LaiXEN1q4i1oMwlnfz5sJ5IoNfVKO+D7Dzqejj5+ik5vjIwfXyqF/gZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Ef75yHj3;
	arc=none smtp.remote-ip=95.215.58.236
Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D25606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 21:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D25606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Ef75yHj3
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kZOrHoSAnT5UgnO8k0w22Mr5IvkNGKHdmxoMOe658bw=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795295875; v=1; x=1795900675;
 b=Ef75yHj383H0XQpxr9m/gL5cVF0vsky/wHvleIAq+/tBgzrJWJvwhMq3op1gev/Zm9TPhbpG
 LFSKYq4SpWLol7o1Z8I58+gtINDPMgul71WNLVDUjlfFMj12f5B0gSH63ldwKLzXm8ey2FDgYAg
 j01wwOnW7lFCrFqrgDOjM4Nube4XqwY+dUOTNkGTt8nRm9k5WSVRKhSC9qh4F0gBwMdR/xLwSX4
 1m2qgWMypcn88OK4NXmD96WgCDSThku497P/ovRDO+8sPb0BKlPGc4WSJQZav9IBH1kh6tiuYWD
 GOQjMAulVHjrNz+zvS2xpPTkuvfrl3i2/3xEOcrQZlBSA==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec504e152cd85e24;
	Sat, 21 Nov 2026 21:17:55 +0000
X-Mizu-Trace-ID: ec504e152cd85e24
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Viktor Pashaiev <w.paszajew@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: usb: keep the tx worker parked through a reset or teardown
Date: Sat, 21 Nov 2026 14:17:40 -0700
Message-ID: <20261121211741.14944-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261021233935.748017-1-lucid_duck@justthetip.ca>
References: <20261021233935.748017-1-lucid_duck@justthetip.ca>
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

On Wed, 21 Oct 2026 16:39:35 -0700, Devin Wittmayer wrote:
> The mt792x USB reset and disconnect paths park the tx worker and then
> stop tx. If frames are still queued when the wait runs out, stopping tx
> parks the worker a second time, which warns.

Felix's "wifi: mt76: usb: do not park the TX worker again under
MT76_RESET", now in mt76, handles the same double park, so this one
can be dropped, thank you.

Devin
