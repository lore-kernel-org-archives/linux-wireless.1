Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099718;
	b=bzp0bRWmvc9Jj4VN9o7RHCHyurnT5TcPkmE/VAdpXk+j/okln/+3uiJmU4S5Q0bclN5o
	 yJ3U4162C0Z36ieIMKR+uqhSaXNvUui4zKqYxin42qOn9b7bptIFAhlJKiJGGhZ3T8KQs
	 66TRuTScLIznxPDotIjU03zlB5YSyQKX7k+HYLiMtSCRy3uLuk8aznrJO1D1HyMnm+pnS
	 5VRZt4gVmXZDL1H5h4OzpS7BAgqyVxEej6q7zCCNOzp6A1d0xOZLOLNpPpXAjgx0j0o72
	 uOcVIWs9mHCCXuOL1TRc3UIQ7smaCxyPQi+D7Q9vsqhbsaorMzRpy3lllP5ysnlTECg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099718;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1YILqJq/M6XQSIqxUemuK26UIDwoSBvzIyzf7viyvl8=;
	b=cVI+/sxZ8X5JxRoHpNBQOKXpE3lpoEFUCN/pCpTe8YJKPLXwkOisOPUVAtQx+XQ056mZ
	 9YRk53+AaDc0AHwAciWyp7O9HhEO7OwogJbxuE4HuyekdubgiNtmUiXPOsNSbL+iUfL3u
	 45fWjLp3Id4mLiM+Wq7rVpbcLolQgGLuy715ZnFkuuS5aZGOlVTLKDv54hW1y2ytrOoMB
	 hMkl1rUXfJPcqOwZVS5V2cRTqaPBmf7j+RNp73RsDMrHRpWg37ewR2zsdvOCD/EdRSief
	 mWzInDzYYSrYLYrQirW+WEpAUTGC3OCfvtFWDagIl4qckDlffhbJdEAxzXh3zXYgFDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=AmIVnHlS;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D41606A33B
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=AmIVnHlS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=1YILqJq/M6XQSIqxUemuK26UIDwoSBvzIyzf7viyvl8=; t=1795099717; x=1796309317; 
	b=AmIVnHlS1GEofBJgMs6DKz6qBE7i2tPkUCdmbf4Q1o/TIIbZpQZrj0/Y+z1svj0Y2Vltd5P8z5J
	3rrfz3uZmrSDA8N0lPLfYS2sYjrRyyTVnBkNO9N7FQi7qkbmeOsgvxGfokamrx1bN3gxNAb7F07qp
	zDbEmMLJwQ2PkIUyKIZMp1mcxVCLr5RMBZtAfgvofjGVSxTRWPszpNAAf6rjAM9I/hI325U64SWKz
	591GAitVCU76+Am0gYEOJgg1BDBOsK4NP41Qg7iirRdFtrC0XQRj8FBHf+h/pL31CR4+UXRQGw3jS
	ztHzE39SNk1WtugrjV04rUx8cavufVkQeygg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xU3RD-00000004PNy-2JzQ;
	Thu, 19 Nov 2026 15:48:35 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH wireless-next] MAINTAINERS: mark purelifi pflxlc driver orphan
Date: Thu, 19 Nov 2026 15:48:33 +0100
Message-ID: <20261119144833.306182-2-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.56.1
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

From: Johannes Berg <johannes.berg@intel.com>

The maintainer's address bounces:

  550 5.4.1 Recipient address rejected: Access denied.
  For more information see https://aka.ms/EXOSmtpErrors

Which according to that link means:

  The recipient's address doesn't exist.

Since I don't have any other contact, mark the driver
as orphaned.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
The hardware was always pretty fringe, maybe we can
remove the driver entirely?
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..1ed316e59c84 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22514,9 +22514,8 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/cec/usb/pulse8/
 
 PURELIFI PLFXLC DRIVER
-M:	Srinivasan Raju <srini.raju@purelifi.com>
 L:	linux-wireless@vger.kernel.org
-S:	Supported
+S:	Orphan
 F:	drivers/net/wireless/purelifi/
 
 PVRUSB2 VIDEO4LINUX DRIVER
-- 
2.56.1

